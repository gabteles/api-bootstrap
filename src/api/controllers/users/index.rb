module API
  module Controllers
    module Users
      class Index
        include Controllers::BaseController
        include App::Inject[userList: 'services.users.list']
        use API::Plugins::AuthenticationPlugin

        def call(_)
          result = userList.execute
          self.body = result.to_json
        end
      end
    end
  end
end
