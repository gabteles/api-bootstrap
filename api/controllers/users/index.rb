module API
  module Controllers
    module Users
      class Index
        include Hanami::Action
        include App::Dependencies[userList: 'services.users.list']

        def call(_)
          result = userList.execute
          self.body = result.to_json
        end
      end
    end
  end
end
