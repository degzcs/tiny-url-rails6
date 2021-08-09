class Visit < ApplicationRecord

  belongs_to :url_info
  validates_presence_of :ip_address
end
