# frozen_string_literal: true

module Nanoc::Int::OutdatednessRules
  class AttributesModified < Nanoc::Int::OutdatednessRule
    include Nanoc::Int::ContractsSupport

    affects_props :attributes, :compiled_content

    contract C::Or[Nanoc::Int::ItemRep, Nanoc::Int::Item, Nanoc::Int::Configuration, Nanoc::Int::Layout], C::Named['Nanoc::Int::OutdatednessChecker'] => C::Maybe[Nanoc::Int::OutdatednessReasons::Generic]
    def apply(obj, outdatedness_checker)
      case obj
      when Nanoc::Int::ItemRep
        apply(obj.item, outdatedness_checker)
      when Nanoc::Int::Item, Nanoc::Int::Layout, Nanoc::Int::Configuration
        if outdatedness_checker.checksum_store[obj] == outdatedness_checker.checksums.checksum_for(obj)
          return nil
        end

        old_checksums = outdatedness_checker.checksum_store.attributes_checksum_for(obj)
        unless old_checksums
          return Nanoc::Int::OutdatednessReasons::AttributesModified.new(true)
        end

        new_checksums = outdatedness_checker.checksums.attributes_checksum_for(obj)

        attributes = Set.new(old_checksums.keys) + Set.new(new_checksums.keys)
        changed_attributes = attributes.reject { |a| old_checksums[a] == new_checksums[a] }

        if changed_attributes.any?
          Nanoc::Int::OutdatednessReasons::AttributesModified.new(changed_attributes)
        end
      else
        raise ArgumentError
      end
    end
  end
end
