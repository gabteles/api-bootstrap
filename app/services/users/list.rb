module App
  module Services
    module Users
      class List
        include App::Dependencies[userRespository: 'repositories.user']

        def execute
          userRespository.all
        end
      end
    end
  end
end
