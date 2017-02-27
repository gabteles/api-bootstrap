module API
  module Controllers
    module Users
      class Index
        include Controllers::BaseController
        include App::Dependencies[userList: 'services.users.list']

        def call(_)
          result = userList.execute
          self.body = result.to_json
        end
      end
    end
  end
end
