require 'fusu/hash/except'
require 'fusu/hash/keys'
require 'fusu/hash/reverse_merge'
module Fusu
  module Hash
    extend Except
    extend Keys
    extend ReverseMerge
  end
end
