# frozen_string_literal: true

module Nanoc
  # @api private
  class ViewContextForCompilation
    include Nanoc::Int::ContractsSupport

    attr_reader :reps
    attr_reader :items
    attr_reader :dependency_tracker
    attr_reader :compilation_context
    attr_reader :snapshot_repo

    contract C::KeywordArgs[
      reps: Nanoc::Int::ItemRepRepo,
      items: Nanoc::Int::IdentifiableCollection,
      dependency_tracker: C::Any,
      compilation_context: C::Any,
      snapshot_repo: C::Any,
    ] => C::Any
    def initialize(reps:, items:, dependency_tracker:, compilation_context:, snapshot_repo:)
      @reps = reps
      @items = items
      @dependency_tracker = dependency_tracker
      @compilation_context = compilation_context
      @snapshot_repo = snapshot_repo
    end
  end
end
