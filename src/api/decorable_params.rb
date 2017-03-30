module API
  class DecorableParams
    def initialize(params, options = {})
      @params = params
      @options = options
    end

    def method_missing(name, *args, &block)
      return options[name] if options.key?(name)
      return params.method(name, *args, &block) if params.respond_to?(name)
      super
    end
  end
end
