# frozen_string_literal: true

module Nanoc::Int::Compiler::Stages
  class Preprocess < Nanoc::Int::Compiler::Stage
    def initialize(action_provider:, site:, dependency_store:, checksum_store:)
      @action_provider = action_provider
      @site = site
      @dependency_store = dependency_store
      @checksum_store = checksum_store
    end

    def run
      return if @site.preprocessed?

      if @action_provider.need_preprocessing?
        @site.data_source = Nanoc::Int::InMemDataSource.new(@site.items, @site.layouts, @site.data_source)
        @action_provider.preprocess(@site)

        @dependency_store.items = @site.items
        @dependency_store.layouts = @site.layouts
        @checksum_store.objects = @site.items.to_a + @site.layouts.to_a + @site.code_snippets + [@site.config]
      end

      @site.mark_as_preprocessed
      @site.freeze
    end
  end
end
