# frozen_string_literal: true

module Nanoc::RuleDSL
  class ActionProvider < Nanoc::Int::ActionProvider
    identifier :rule_dsl

    # @api private
    attr_reader :rules_collection

    def self.for(site)
      rules_collection = Nanoc::RuleDSL::RulesCollection.new

      action_sequence_calculator =
        Nanoc::RuleDSL::ActionSequenceCalculator.new(
          rules_collection: rules_collection, site: site,
        )

      action_provider = new(rules_collection, action_sequence_calculator)

      Nanoc::RuleDSL::RulesLoader.new(site.config, rules_collection).load

      action_provider
    end

    def initialize(rules_collection, action_sequence_calculator)
      @rules_collection = rules_collection
      @action_sequence_calculator = action_sequence_calculator
    end

    def rep_names_for(item)
      matching_rules = @rules_collection.item_compilation_rules_for(item)
      raise Nanoc::Int::Errors::NoMatchingCompilationRuleFound.new(item) if matching_rules.empty?

      matching_rules.map(&:rep_name).uniq
    end

    def action_sequence_for(obj)
      @action_sequence_calculator[obj]
    end

    def need_preprocessing?
      @rules_collection.preprocessors.any?
    end

    def preprocess(site)
      ctx = new_preprocessor_context(site)

      @rules_collection.preprocessors.each_value do |preprocessor|
        ctx.instance_eval(&preprocessor)
      end

      site.data_source =
        Nanoc::Int::InMemDataSource.new(ctx.items._unwrap, ctx.layouts._unwrap, site.data_source)
    end

    def postprocess(site, compiler)
      dependency_tracker = Nanoc::Int::DependencyTracker::Null.new

      res = compiler.run_until_reps_built
      reps = res.fetch(:reps)

      view_context =
        Nanoc::ViewContextForCompilation.new(
          reps: reps,
          items: site.items,
          dependency_tracker: dependency_tracker,
          compilation_context: compiler.compilation_context(reps: reps),
          snapshot_repo: nil,
        )
      ctx = new_postprocessor_context(site, view_context)

      @rules_collection.postprocessors.each_value do |postprocessor|
        ctx.instance_eval(&postprocessor)
      end
    end

    # @api private
    def new_preprocessor_context(site)
      view_context =
        Nanoc::ViewContextForPreCompilation.new(items: site.items)

      Nanoc::Int::Context.new(
        config: Nanoc::MutableConfigView.new(site.config, view_context),
        items: Nanoc::MutableItemCollectionView.new(site.items, view_context),
        layouts: Nanoc::MutableLayoutCollectionView.new(site.layouts, view_context),
      )
    end

    # @api private
    def new_postprocessor_context(site, view_context)
      Nanoc::Int::Context.new(
        config: Nanoc::ConfigView.new(site.config, view_context),
        items: Nanoc::PostCompileItemCollectionView.new(site.items, view_context),
      )
    end
  end
end
