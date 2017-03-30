module App
  module Repositories
    class HardcodedUserRepository
      HARDCODED_SAMPLE_USER_LIST = [
        App::Entities::User.new(uuid: SecureRandom.uuid, name: 'John'),
        App::Entities::User.new(uuid: SecureRandom.uuid, name: 'Jane')
      ].freeze

      def all
        HARDCODED_SAMPLE_USER_LIST
      end
    end
  end
end
