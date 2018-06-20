# frozen_string_literal: true

module Nanoc::RuleDSL
  class CompilationRule < Rule
    include Nanoc::Int::ContractsSupport

    contract Nanoc::Int::ItemRep, C::KeywordArgs[
      site: Nanoc::Int::Site,
      recorder: Nanoc::RuleDSL::ActionRecorder,
      view_context: Nanoc::ViewContextForPreCompilation,
    ] => C::Any
    def apply_to(rep, site:, recorder:, view_context:)
      context = Nanoc::RuleDSL::CompilationRuleContext.new(
        rep: rep,
        recorder: recorder,
        site: site,
        view_context: view_context,
      )

      context.instance_exec(matches(rep.item.identifier), &@block)
    end
  end
end
