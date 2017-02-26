class App::Entities::BaseEntity < Dry::Struct
  module Types
    include Dry::Types.module

    UUIDv4 = String.constrained(format: /[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}/i)
  end

  def to_json(*args)
    to_h.to_json(*args)
  end
end
