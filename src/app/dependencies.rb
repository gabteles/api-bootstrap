module App
  Dependencies = Dry::Container.new.tap do |container|
    container.namespace(:services) do
      namespace(:users) do
        register(:list) { App::Services::Users::List.new }
        register(:authenticate) { App::Services::Users::Authenticate.new }
      end
    end

    container.namespace(:repositories) do
      register(:user) { App::Repositories::HardcodedUserRepository.new }
    end
  end
end
