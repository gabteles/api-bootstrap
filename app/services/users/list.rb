class App::Services::Users::List
  include App::Dependencies[userRespository: 'repositories.user']

  def execute
    userRespository.all
  end
end
