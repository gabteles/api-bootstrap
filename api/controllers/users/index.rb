module API::Controllers::Users
  class Index
    include Hanami::Action
    include App::Dependencies[userList: 'services.users.list']

    def call(params)
      result = userList.execute
      self.body = result.to_json
    end
  end
end
