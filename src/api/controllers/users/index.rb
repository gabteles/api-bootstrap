module API
  module Controllers
    module Users
      class Index
        prepend API::Plugins::AuthenticationPlugin
        include Controllers::BaseController
        include App::Inject[userList: 'services.users.list']

        def call(_)
          result = userList.execute
          self.body = result.to_json
        end
      end
    end
  end
end
