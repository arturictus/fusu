require 'fusu/hash/except'
require 'fusu/hash/keys'
require 'fusu/hash/reverse_merge'
require 'fusu/hash/deep_merge'
module Fusu
  module Hash
    extend Except
    extend Keys
    extend ReverseMerge
    extend DeepMerge

    def extractable_options?(elem)
      elem.instance_of?(::Hash)
    end

    def reject_key(hash, *keys)
      hash.reject{ |k, v| keys.include?(k) }
    end
  end
end
