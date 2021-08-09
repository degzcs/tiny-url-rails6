class CreateVisit
  attr_reader :visit, :errors, :token

  def initialize
    @errors = []
  end

  def call(ip_address:, token:)
    @token = token
    @visit = Visit.new(
      ip_address: ip_address,
      url_info_id: url_info.id
    )
    errors << visit.errors.full_messages unless visit.save
  rescue => e
    errors << e.messsage
  end

  def url_info
    @url_info ||= UrlInfo.find_by(token: token)
  end
end
