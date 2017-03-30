module App
  module Services
    class ServiceResponse < Dry::Struct
      constructor_type :schema

      attribute :data, Types::Any
      attribute :errors, Types::Strict::Array.optional.default([])
      attribute :code, Types::Coercible::Int.default(ErrorCodes::NONE)

      def success?
        errors.empty? && code.eql?(ErrorCodes::NONE)
      end
    end
  end
end
