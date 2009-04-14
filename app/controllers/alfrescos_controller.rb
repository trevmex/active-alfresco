class AlfrescosController < ApplicationController
  # GET /alfrescos
  # GET /alfrescos.xml
  def index
    @alfrescos = Alfresco.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alfrescos }
    end
  end

  # GET /alfrescos/1
  # GET /alfrescos/1.xml
  def show
    @alfresco = Alfresco.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alfresco }
    end
  end

  # GET /alfrescos/new
  # GET /alfrescos/new.xml
  def new
    @alfresco = Alfresco.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alfresco }
    end
  end

  # GET /alfrescos/1/edit
  def edit
    @alfresco = Alfresco.find(params[:id])
  end

  # POST /alfrescos
  # POST /alfrescos.xml
  def create
    @alfresco = Alfresco.new(params[:alfresco])

    respond_to do |format|
      if @alfresco.save
        flash[:notice] = 'Alfresco was successfully created.'
        format.html { redirect_to(@alfresco) }
        format.xml  { render :xml => @alfresco, :status => :created, :location => @alfresco }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alfresco.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alfrescos/1
  # PUT /alfrescos/1.xml
  def update
    @alfresco = Alfresco.find(params[:id])

    respond_to do |format|
      if @alfresco.update_attributes(params[:alfresco])
        flash[:notice] = 'Alfresco was successfully updated.'
        format.html { redirect_to(@alfresco) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alfresco.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alfrescos/1
  # DELETE /alfrescos/1.xml
  def destroy
    @alfresco = Alfresco.find(params[:id])
    @alfresco.destroy

    respond_to do |format|
      format.html { redirect_to(alfrescos_url) }
      format.xml  { head :ok }
    end
  end
end
