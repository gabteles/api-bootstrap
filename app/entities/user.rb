module App::Entities
  class User < BaseEntity
    attribute :uuid, Types::Strict::String
    attribute :name, Types::String
  end
end
