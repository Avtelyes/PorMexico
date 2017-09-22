class Location < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, :if => :address_changed? or :longitude_changed?
  has_one :post
end
