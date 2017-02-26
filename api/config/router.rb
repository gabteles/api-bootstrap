module API::Config
  Router = Hanami::Router.new do
    get '/', to: API::Controllers::Users::Index
  end
end
