class App::Repositories::HardcodedUserRepository
  HARDCODED_SAMPLE_USER_LIST = [
    App::Entities::User.new(uuid: SecureRandom.uuid, name: 'John'),
    App::Entities::User.new(uuid: SecureRandom.uuid, name: 'Jane'),
  ]

  def all
    HARDCODED_SAMPLE_USER_LIST
  end
end
