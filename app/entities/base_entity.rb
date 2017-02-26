class App::Entities::BaseEntity < Dry::Struct
  module Types
    include Dry::Types.module
  end

  def to_json(*args)
    to_h.to_json(*args)
  end
end
