module Fusu
  module Hash
    module DeepReject
      def deep_reject(hash, &block)
        hash.each_with_object({}) do |(k, v), memo|
          unless block.call(k, v)
            if v.is_a?(Hash)
              memo[k] = deep_reject(v, &block)
            else
              memo[k] = v
            end
          end
        end
      end
    end
  end
end
