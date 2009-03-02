class Group < ActiveRecord::Base
  validates_presence_of     :name
  validates_format_of :url, :with =>  %r{^http://}i #weak but it'll do
  has_many :locations, :through=>:events
  has_many :events
  validates_uniqueness_of :name
  
end
