# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'b857c5911cf8c1fb9188f1cdfb138372'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  def setFakeLocation
     @location = GeoIPClient.city("68.180.219.139")
  end
  
 
  def debugLocation(location)
    txt=''
    location.each {|l|
       txt=l.to_s+"\n"+txt;
    }
    txt
  end 
  
  def setupMap(latitude, longitude)
    logger.info "Setting up a map "
    if @map==nil
       @map = GMap.new("map_div_id")  
    end
    @map.control_init(:large_map => true, :map_type => true)  
    @map.center_zoom_init([latitude,longitude], 4)  
   
    marker = GMarker.new([latitude, longitude],   
     :title => "Where is  this  event?", :info_window => "Hello")  
    @map.overlay_init(marker)
   
   return @map
 end
  
 end
