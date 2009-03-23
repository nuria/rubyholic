class Event < ActiveRecord::Base
  
  validates_presence_of :name, :description, :start_date, :end_date
  validates_uniqueness_of :name
  belongs_to :group #has to be  singular
  belongs_to :location # has to be  singular
  
  acts_as_mappable :through => :location,
                   :default_units => :kms, 
                   :default_formula => :flat, 
                   :distance_field_name => :distance,
                   :lat_column_name=>'latitude',
                   :lng_column_name=>'longitude'
                   
    def to_s
      "Name="+name
    end
end
