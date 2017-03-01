module App
  module Entities
    class BaseEntity < Dry::Struct
      def to_json(*args)
        to_h.to_json(*args)
      end
    end
  end
end
