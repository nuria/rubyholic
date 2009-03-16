class Group < ActiveRecord::Base
  validates_presence_of     :name
  validates_format_of :url, :with =>  %r{^http://}i #weak but it'll do
  has_many :locations, :through=>:events
  has_many :events
  validates_uniqueness_of :name
  
  # attributes for pagination
  cattr_reader :per_page
  @@per_page = 5

  define_index do
    indexes name, :as =>:name, :sortable=>true, :sort_order=>"ascending"
    indexes events.description, :as => :event_descriptions # we are only searching by group name  so do we need these? 
    indexes [locations.name ], :as => :location_name
  end
  
end
