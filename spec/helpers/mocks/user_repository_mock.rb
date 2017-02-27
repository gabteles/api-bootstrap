class UserRepositoryMock
  def initialize(results)
    @results = results.clone
  end

  def all
    @results
  end
end
