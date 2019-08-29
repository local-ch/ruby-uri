require 'active_support/core_ext/module/delegation'

module LocalUri
  class URI

    delegate(
      :to_s,
      :scheme,
      :scheme=,
      :host,
      :host=,
      :path,
      :path=,
      to: :uri
    )
    attr_reader :uri

    def initialize(string)
      @uri = ::URI.parse(string)
    end

    def dup
      self.class.new(@uri.to_s)
    end

    def query_string
      @uri.query
    end

    def query_string=(val)
      @uri.query = val
    end
    alias query= query_string=

    def query
      LocalUri::Query.new(self)
    end
    alias params query
  end
end