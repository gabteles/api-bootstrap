RSpec.describe App::Services::Users::List do
  subject(:service) { App::Services::Users::List.new(dependencies).execute }

  let(:repository_results) { [App::Entities::User.new(uuid: SecureRandom.uuid, name: 'john')] }
  let(:user_repository) { UserRepositoryMock.new(repository_results) }
  let(:dependencies) { { user_repository: user_repository } }

  it { is_expected.to eq(repository_results) }
  it { expect { service }.to_not raise_error }
end
