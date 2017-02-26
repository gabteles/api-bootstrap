module App::Entities
  class User < BaseEntity
    attribute :uuid, Types::UUIDv4
    attribute :name, Types::String
  end
end
