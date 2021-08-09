class CreateUrlInfo
  attr_reader :url_formatter, :errors, :token, :short_url

  def initialize(url_formatter: UrlFormatter)
    @errors = []
    @url_formatter = url_formatter.new
  end

  # @return [String] with the short url
  def call(url:)
    token = token_builder
    url_info = UrlInfo.create(
      url: format_url!(url),
      token: token)

    errors << url_info.errors.full_messages if url_info.invalid?
    @short_url = url_formatter.call(token: token)
  rescue => e
    errors << e.message
  end

  def token_builder(timestamp: Time.now.to_i)
    encoded_token = Digest::MD5.hexdigest timestamp.to_s
    @token = encoded_token.first(8)
    if exits?(token)
      token_builder(timestamp: timestamp + 1)
    else
      token
    end
  end

  def format_url!(url)
    return 'http://' + url if URI(url).scheme.blank?
    url
  end

  def exits?(token)
    UrlInfo.exists?(token: token)
  end

  def valid?
    errors.empty?
  end
end
