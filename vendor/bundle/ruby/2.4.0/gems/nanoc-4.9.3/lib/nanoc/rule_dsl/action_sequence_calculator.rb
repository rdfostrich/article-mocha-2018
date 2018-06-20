# frozen_string_literal: true

module Nanoc::RuleDSL
  class ActionSequenceCalculator
    DDMemoize.activate(self)

    class UnsupportedObjectTypeException < ::Nanoc::Error
      def initialize(obj)
        super("Do not know how to calculate the action sequence for #{obj.inspect}")
      end
    end

    class NoActionSequenceForLayoutException < ::Nanoc::Error
      def initialize(layout)
        super("There is no layout rule specified for #{layout.inspect}")
      end
    end

    class NoActionSequenceForItemRepException < ::Nanoc::Error
      def initialize(item)
        super("There is no compilation rule specified for #{item.inspect}")
      end
    end

    class PathWithoutInitialSlashError < ::Nanoc::Error
      def initialize(rep, basic_path)
        super("The path returned for the #{rep.inspect} item representation, “#{basic_path}”, does not start with a slash. Please ensure that all routing rules return a path that starts with a slash.")
      end
    end

    # @api private
    attr_accessor :rules_collection

    # @param [Nanoc::Int::Site] site
    # @param [Nanoc::RuleDSL::RulesCollection] rules_collection
    def initialize(site:, rules_collection:)
      @site = site
      @rules_collection = rules_collection
    end

    # @param [#reference] obj
    #
    # @return [Nanoc::Int::ActionSequence]
    def [](obj)
      case obj
      when Nanoc::Int::ItemRep
        new_action_sequence_for_rep(obj)
      when Nanoc::Int::Layout
        new_action_sequence_for_layout(obj)
      else
        raise UnsupportedObjectTypeException.new(obj)
      end
    end

    def new_action_sequence_for_rep(rep)
      view_context =
        Nanoc::ViewContextForPreCompilation.new(items: @site.items)

      recorder = Nanoc::RuleDSL::ActionRecorder.new(rep)
      rule = @rules_collection.compilation_rule_for(rep)

      unless rule
        raise NoActionSequenceForItemRepException.new(rep)
      end

      recorder.snapshot(:raw)
      rule.apply_to(rep, recorder: recorder, site: @site, view_context: view_context)
      recorder.snapshot(:post) if recorder.any_layouts?
      recorder.snapshot(:last) unless recorder.last_snapshot?
      recorder.snapshot(:pre) unless recorder.pre_snapshot?

      copy_paths_from_routing_rules(compact_snapshots(recorder.action_sequence), rep: rep)
    end

    # @param [Nanoc::Int::Layout] layout
    #
    # @return [Nanoc::Int::ActionSequence]
    def new_action_sequence_for_layout(layout)
      res = @rules_collection.filter_for_layout(layout)

      unless res
        raise NoActionSequenceForLayoutException.new(layout)
      end

      Nanoc::Int::ActionSequence.build(layout) do |b|
        b.add_filter(res[0], res[1])
      end
    end

    def compact_snapshots(seq)
      actions = []
      seq.actions.each do |action|
        if [actions.last, action].all? { |a| a.is_a?(Nanoc::Int::ProcessingActions::Snapshot) }
          actions[-1] = actions.last.update(snapshot_names: action.snapshot_names, paths: action.paths)
        else
          actions << action
        end
      end
      Nanoc::Int::ActionSequence.new(seq.item_rep, actions: actions)
    end

    def copy_paths_from_routing_rules(seq, rep:)
      seq.map do |action|
        if action.is_a?(Nanoc::Int::ProcessingActions::Snapshot) && action.paths.empty?
          copy_path_from_routing_rule(action, rep: rep)
        else
          action
        end
      end
    end

    def copy_path_from_routing_rule(action, rep:)
      paths_from_rules =
        action.snapshot_names.map do |snapshot_name|
          basic_path_from_rules_for(rep, snapshot_name)
        end.compact

      if paths_from_rules.any?
        action.update(paths: paths_from_rules.map(&:to_s))
      else
        action
      end
    end

    # FIXME: ugly
    def basic_path_from_rules_for(rep, snapshot_name)
      routing_rules = @rules_collection.routing_rules_for(rep)
      routing_rule = routing_rules[snapshot_name]
      return nil if routing_rule.nil?

      view_context =
        Nanoc::ViewContextForPreCompilation.new(items: @site.items)

      basic_path =
        routing_rule.apply_to(
          rep,
          site: @site,
          view_context: view_context,
        )

      if basic_path && !basic_path.start_with?('/')
        raise PathWithoutInitialSlashError.new(rep, basic_path)
      end

      basic_path
    end
  end
end
