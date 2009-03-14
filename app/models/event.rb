class Event < ActiveRecord::Base
  
  validates_presence_of :name, :description, :start_date, :end_date
  validates_uniqueness_of :name
  belongs_to :group #has to be  singular
  belongs_to :location # has to be  singular
end
