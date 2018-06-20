# frozen_string_literal: true

module Nanoc
  class ItemCollectionWithoutRepsView < ::Nanoc::IdentifiableCollectionView
    # @api private
    def view_class
      Nanoc::BasicItemView
    end
  end
end
