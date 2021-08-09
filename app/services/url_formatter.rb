class UrlFormatter
  attr_reader :domain, :short_url
  ConfigError = Class.new(StandardError)

  def initialize
    @domain = Rails.application.routes.default_url_options[:host]
    raise ConfigError, 'Missing host configuration' if @domain.nil?
  end

  def call(token:)
    @short_url = domain + '/' + token
  end
end
