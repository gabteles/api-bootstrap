module App
  module Services
    module Users
      class List
        include App::Inject[user_repository: 'repositories.user']

        def execute
          user_repository.all
        end
      end
    end
  end
end
