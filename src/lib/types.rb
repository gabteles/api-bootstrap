module Types
  include Dry::Types.module

  Any = Nil | Symbol | Class | True | False | Bool | Date | DateTime | Time | Array | Hash

  UUIDv4 = String.constrained(
    format: /[a-f0-9]{8}-
             [a-f0-9]{4}-
             4[a-f0-9]{3}-
             [89ab][a-f0-9]{3}-
             [a-f0-9]{12}/ix
  )
end
