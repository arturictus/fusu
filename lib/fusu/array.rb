module Fusu
  module Array
    def self.wrap(object)
      if object.nil?
        []
      elsif object.respond_to?(:to_ary)
        object.to_ary || [object]
      else
        [object]
      end
    end

    # Extracts options from a set of arguments. Removes and returns the last
    # element in the array if it's a hash, otherwise returns a blank hash.
    #
    #   def options(*args)
    #     args.extract_options!
    #   end
    #
    #   options(1, 2)        # => {}
    #   options(1, 2, a: :b) # => {:a=>:b}
    def self.extract_options!(ary)
      if ary.last.is_a?(::Hash) && Fusu::Hash.extractable_options?(ary.last)
        ary.pop
      else
        {}
      end
    end
  end
end
