class AddTestData < ActiveRecord::Migration
  def self.up
    
    Group.delete_all
    Event.delete_all
    Location.delete_all
    
    l1 = Location.create! :name => "The Ruby ", :latitude => "25.0", :longitude => "0.0"
    l2 = Location.create(:name=>'The Park',:latitude=>'25.0',:longitude=>'50.0') 
    l3 = Location.create(:name=>'The Cafe',:latitude=>'20.0',:longitude=>'60.0') 
    l4 = Location.create(:name=>'The Van',:latitude=>'20.0',:longitude=>'60.0')
    l5  = Location.create(:name=>'The Pretty Park',:latitude=>'25.0',:longitude=>'50.0') 
    

   
   
   
    Location.create(:name=>'The Pretty Cafe',:latitude=>'20.0',:longitude=>'60.0') 
    Location.create(:name=>'The Pretty Van',:latitude=>'20.0',:longitude=>'60.0')
    Location.create(:name=>'The Ugly Park',:latitude=>'25.0',:longitude=>'50.0') 
    Location.create(:name=>'The Ugly Cafe',:latitude=>'20.0',:longitude=>'60.0') 
    Location.create(:name=>'The Ugly Van',:latitude=>'20.0',:longitude=>'60.0')
    Location.create(:name=>'The Quiet Park',:latitude=>'25.0',:longitude=>'50.0') 
    Location.create(:name=>'The Ugly Cafe',:latitude=>'20.0',:longitude=>'60.0') 
    Location.create(:name=>'The Ugly Van',:latitude=>'20.0',:longitude=>'60.0')
    
    
   g1 = Group.create(:name => 'Ruby Red',:url=>"http://ruby-red.com")
   g2 = Group.create(:name => 'Ruby Yellow',:url=>"http://ruby-yellow.com")
   g3 = Group.create(:name => 'Ruby Blues',:url=>"http://ruby-blues.com")   
    Group.create(:name => 'Ruby Dark Red',:url=>"http://ruby-dark-red.com")
    Group.create(:name => 'Ruby Dark Yellow',:url=>"http://ruby-dark-yellow.com")
    Group.create(:name => 'Ruby Dark Blues',:url=>"http://ruby-dark-blues.com")
    Group.create(:name => 'Ruby Lite Red',:url=>"http://ruby-lite-red.com")
    Group.create(:name => 'Ruby Lite Yellow',:url=>"http://ruby-lite-yellow.com")
    Group.create(:name => 'Ruby Lite Blues',:url=>"http://ruby-lite-blue.com")
    
  #  g = Group.create! :location => l1, :name => "MyGroup"
    
   e1 = Event.create(:name=>'Ruby b-day party',
                      :description=>'Blah blah', 
                      :start_date=>'2009-01-01', 
                      :end_date=>'2009-02-02', :location_id=>l1.id, :group_id=>g1.id)
    e2 = Event.create(:name=>'Ruby new year party',
                      :description=>'Blah blah', 
                      :start_date=>'2008-12-30', 
                      :end_date=>'2009-01-02',:location_id=>l2.id,:group_id=>g2.id)
                      
                      
    
    
    
    
  end

  def self.down
    Location.delete_all
    Event.delete_all
    Group.delete_all
  end
end
