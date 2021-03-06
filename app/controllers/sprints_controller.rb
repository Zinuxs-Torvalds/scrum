class SprintsController < ApplicationController
  
  before_filter :login_required
  
  # GET /sprints
  # GET /sprints.xml
  def index
    @sprints = Sprint.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @sprints.to_xml }
    end
  end

  # GET /sprints/1
  # GET /sprints/1.xml
  def show
    @sprint = Sprint.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @sprint.to_xml }
    end
  end

  # GET /sprints/new
  def new
    @sprint = Sprint.new
  end

  # GET /sprints/1;edit
  def edit
    @sprint = Sprint.find(params[:id])
  end

  # POST /sprints
  # POST /sprints.xml
  def create
    @sprint = Sprint.create(params[:sprint])
    respond_to do |format|
      flash[:notice] = 'Sprint was successfully created.'
      format.html { redirect_to sprint_url(@sprint) }
      format.xml  { head :created, :location => sprint_url(@sprint) }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => "new" }
      format.xml  { render :xml => @sprint.errors.to_xml }
    end
  end

  # PUT /sprints/1
  # PUT /sprints/1.xml
  def update
    @sprint = Sprint.find(params[:id])
    @sprint.update_attributes(params[:sprint])
    
    respond_to do |format|
        flash[:notice] = 'Sprint was successfully updated.'
        format.html { redirect_to sprint_url(@sprint) }
        format.xml  { head :ok }
    end
  rescue ActiveRecord::RecordInvalid  
    respond_to do |format|
      format.html { render :action => "edit" }
      format.xml  { render :xml => @sprint.errors.to_xml }
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.xml
  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy

    respond_to do |format|
      format.html { redirect_to sprints_url }
      format.xml  { head :ok }
    end
  end
end
