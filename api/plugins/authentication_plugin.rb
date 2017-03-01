module API
  module Plugins
    module AuthenticationPlugin
      HTTP_AUTHENTICATION_HEADER = 'HTTP_AUTHORIZATION'.freeze
      AUTHENTICATION_SERVICE = 'services.users.authenticate'.freeze

      def call(params)
        auth_params = authentication_params(params)
        result = App::Dependencies[AUTHENTICATION_SERVICE].execute(auth_params)
        new_params = API::DecorableParams.new(params, authentication: result)
        super(new_params)
      end

      private

      def authentication_params(params)
        { authentication: params.env[HTTP_AUTHENTICATION_HEADER] }
      end
    end
  end
end
