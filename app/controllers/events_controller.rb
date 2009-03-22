class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  
  ## Finds  events  near you
  
  def index
    @location = setFakeLocation();
    # now  find events  near you 
    setupMap(@location[2],@location[3])
    
    if params[:search_term]=="all"
      @events = Event.find(:all)
      render :action => "index"
    else
      logger.info("Initialiazing Location Adapter with location:"+debugLocation(@location))
      @events = Event.find(:all, :origin => [@location[2],@location[3]], :within => 5000)    
      # now  put those  in the  map
      
      @events.each {|e|
          setupMap(e.location.latitude, e.location.longitude)
      }
      
      case @events.length
      when 0 then render :action => "no_results"
      when 1..5 then render :action => "events_near_you"
    end
    end
    
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    setupMap(@event.location.latitude, @event.location.longitude)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  
 
  
end
