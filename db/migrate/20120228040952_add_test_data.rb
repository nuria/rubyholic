class AddTestData < ActiveRecord::Migration
  def self.up
    
    #Group.delete_all
   # Event.delete_all
    #Location.delete_all
    
    l1 = Location.create! :name => "The Ruby ", :latitude => "25.0", :longitude => "0.0"
    l2 = Location.create(:name=>'The Park',:latitude=>'25.0',:longitude=>'50.0') 
    l3 = Location.create(:name=>'The Cafe',:latitude=>'20.0',:longitude=>'60.0') 
    l4 = Location.create(:name=>'The Van',:latitude=>'20.0',:longitude=>'60.0')
    l5  = Location.create(:name=>'The Pretty Park',:latitude=>'25.0',:longitude=>'50.0') 
    

   
   
   
    Location.create(:name=>'The Pretty Cafe',:latitude=>'20.0',:longitude=>'60.0') 
    Location.create(:name=>'The Pretty Van',:latitude=>'20.0',:longitude=>'60.0')
    Location.create(:name=>'The Ugly Park',:latitude=>'25.0',:longitude=>'50.0') 
    Location.create(:name=>'The Ugly Cafe',:latitude=>'20.0',:longitude=>'60.0') 
    Location.create(:name=>'The Ugly Van',:latitude=>'20.0',:longitude=>'48.0')
    Location.create(:name=>'The Quiet Park',:latitude=>'25.0',:longitude=>'48.0') 
    Location.create(:name=>'The Ugly Cafe',:latitude=>'20.0',:longitude=>'60.0') 
    Location.create(:name=>'The Ugly Van',:latitude=>'20.0',:longitude=>'60.0')
    
    
   g1 = Group.create(:name => 'Ruby Red',:url=>"http://ruby-red.com",:description=>"The Reds")
   g2 = Group.create(:name => 'Ruby Yellow',:url=>"http://ruby-yellow.com",:description=>"The yellows")
   g3 = Group.create(:name => 'Ruby Blues',:url=>"http://ruby-blues.com",:description=>"The blues")   
   g4 = Group.create(:name => 'Ruby Dark Red',:url=>"http://ruby-dark-red.com", :description=>"The dark red")
   g5 = Group.create(:name => 'Ruby Dark Yellow',:url=>"http://ruby-dark-yellow.com",:description=>"The dark yellow" )
    Group.create(:name => 'Ruby Dark Blues',:url=>"http://ruby-dark-blues.com", :description=>"The dark blue")
    Group.create(:name => 'Ruby Lite Red',:url=>"http://ruby-lite-red.com",:description=>"The lite red")
    Group.create(:name => 'Ruby Lite Yellow',:url=>"http://ruby-lite-yellow.com",:description=>"The lite yellow")
    Group.create(:name => 'Ruby Lite Blues',:url=>"http://ruby-lite-blue.com",:description=>"The lites")
    
    Group.create(:name => 'Ruby Dark Red 2',:url=>"http://ruby-dark-red.com", :description=>"The dark red")
    Group.create(:name => 'Ruby Dark Yellow 2',:url=>"http://ruby-dark-yellow.com",:description=>"The dark yellow" )
    Group.create(:name => 'Ruby Dark Blues 2',:url=>"http://ruby-dark-blues.com", :description=>"The dark blue")
    Group.create(:name => 'Ruby Lite Red 2',:url=>"http://ruby-lite-red.com",:description=>"The lite red")
    Group.create(:name => 'Ruby Lite Yellow 2',:url=>"http://ruby-lite-yellow.com",:description=>"The lite yellow")
    Group.create(:name => 'Ruby Lite Blues 2',:url=>"http://ruby-lite-blue.com",:description=>"The lites")
    
    
  #  g = Group.create! :location => l1, :name => "MyGroup"
    
   e1 = Event.create(:name=>'Ruby b-day party',
                      :description=>'Blah blah', 
                      :start_date=>'2009-01-01', 
                      :end_date=>'2009-02-02', :location_id=>l1.id, :group_id=>g1.id)
                      
   e1_2 = Event.create(:name=>'Ruby b-day party II',
                      :description=>'Blah blah', 
                      :start_date=>'2009-02-03', 
                      :end_date=>'2009-02-04', :location_id=>l1.id, :group_id=>g1.id)             
                      
   e2 = Event.create(:name=>'Ruby new year party I',
                      :description=>'Blah blah', 
                      :start_date=>'2008-12-30', 
                      :end_date=>'2009-01-02',:location_id=>l2.id,:group_id=>g2.id)
       
   e2_2 = Event.create(:name=>'Ruby Jan 15th metting',
                      :description=>'Blah blah', 
                      :start_date=>'2009-01-15', 
                      :end_date=>'2009-01-16',:location_id=>l2.id,:group_id=>g2.id)
                      
    e3 = Event.create(:name=>'Ruby party',
                      :description=>'Blah blah', 
                      :start_date=>'2009-03-11', 
                      :end_date=>'2009-03-12',:location_id=>l3.id,:group_id=>g3.id)
    
    e3_2 = Event.create(:name=>'Ruby party',
                      :description=>'Blah blah', 
                      :start_date=>'2009-03-12', 
                      :end_date=>'2009-03-14',:location_id=>l3.id,:group_id=>g3.id)
    
   e4 = Event.create(:name=>'Ruby boring party',
                      :description=>'Blah blah', 
                      :start_date=>'2009-02-29', 
                      :end_date=>'2009-03-01',:location_id=>l4.id,:group_id=>g4.id)
    
    e4_2 = Event.create(:name=>'Ruby boring party II',
                      :description=>'Blah blah', 
                      :start_date=>'2009-03-02', 
                      :end_date=>'2009-03-04',:location_id=>l4.id,:group_id=>g4.id)
    
    e5 = Event.create(:name=>'Ruby Rave',
                      :description=>'Blah blah', 
                      :start_date=>'2009-04-30', 
                      :end_date=>'2009-05-02',:location_id=>l5.id,:group_id=>g5.id)
  end

  def self.down
    Location.delete_all
    Event.delete_all
    Group.delete_all
  end
end
