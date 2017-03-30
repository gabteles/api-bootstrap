module App
  module Services
    module Users
      class Authenticate
        def execute(_auth_params)
          # TODO
          ServiceResponse.new(data: 1)
        end
      end
    end
  end
end
