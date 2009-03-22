class Location < ActiveRecord::Base
  validates_presence_of   :name
  validates_uniqueness_of :name
  has_many :events
  has_many :groups, :through=>:events
  acts_as_mappable :default_units => :kms, 
                   :default_formula => :flat, 
                   :distance_field_name => :distance,
                   :lat_column_name=>'latitude',
                   :lng_column_name=>'longitude'
end

