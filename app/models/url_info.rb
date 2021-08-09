class UrlInfo < ApplicationRecord

  validates_presence_of :url
  has_many :visits
end
