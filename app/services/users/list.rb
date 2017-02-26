module App::Services::Users
  class List
    HARDCODED_SAMPLE_USER_LIST = [
      { id: 1, name: 'John'},
      { id: 2, name: 'Jane'},
    ]

    def execute
      return HARDCODED_SAMPLE_USER_LIST
    end
  end
end
