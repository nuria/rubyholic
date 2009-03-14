class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  def index
   # @groups = Group.find(:all,:limit =>5) 
    # The  number of records per page  is specified  in the  model
    
     if params[:search_term] == nil
       @groups = Group.paginate(:page => params[:page])
       logger.info "No search term, geting default page size. Num results: "+@groups.length.to_s
     else 
       @groups = Group.search params[:search_term]
       # how  do  you paginate this  search now?
       # how  do you get the  groups  taht match a certain event?
       logger.info "Search term is:#{params[:search_term]} .Num results: "+@groups.length.to_s
    
  end
    
    case @groups.length
      when 0 then render :action => "no_results"
      when 1..5 then render :action => "index"
    end

   
    #respond_to do |format|
     # format.html # index.html.erb
      #format.xml  { render :xml => @groups }
    #end
    
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        flash[:notice] = 'Group was successfully created.'
        format.html { redirect_to(@group) }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
  
  

end
