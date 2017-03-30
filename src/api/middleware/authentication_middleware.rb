module API
  module Middleware
    class AuthenticationMiddleware
      HTTP_AUTHENTICATION_HEADER = 'HTTP_AUTHORIZATION'.freeze
      AUTHENTICATION_SERVICE = 'services.users.authenticate'.freeze

      def initialize(app, authentication_service: nil)
        @app = app
        @authentication_service = authentication_service || App::Dependencies[AUTHENTICATION_SERVICE]
      end

      def call(env)
        auth_params = authentication_params(env)
        result = @authentication_service.execute(auth_params)
        env[:authentication] = result.data
        @app.call(env)
      end

      private

      def authentication_params(env)
        { authentication: env[HTTP_AUTHENTICATION_HEADER] }
      end
    end
  end
end
