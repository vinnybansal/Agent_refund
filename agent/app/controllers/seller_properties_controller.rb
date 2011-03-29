class SellerPropertiesController < ApplicationController
  before_filter :require_user
  # GET /seller_properties
  # GET /seller_properties.xml
  def index
    @seller_properties = SellerProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seller_properties }
    end
  end

  # GET /seller_properties/1
  # GET /seller_properties/1.xml
  def show
    @seller_property = SellerProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seller_property }
    end
  end

  # GET /seller_properties/new
  # GET /seller_properties/new.xml
  def new
    @seller_property = SellerProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seller_property }
    end
  end

  # GET /seller_properties/1/edit
  def edit
    @seller_property = SellerProperty.find(params[:id])
  end

  # POST /seller_properties
  # POST /seller_properties.xml
  def create
    @seller_property = SellerProperty.new(params[:seller_property])

    respond_to do |format|
      if @seller_property.save
        format.html { redirect_to(@seller_property, :notice => 'Seller property was successfully created.') }
        format.xml  { render :xml => @seller_property, :status => :created, :location => @seller_property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seller_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seller_properties/1
  # PUT /seller_properties/1.xml
  def update
    @seller_property = SellerProperty.find(params[:id])

    respond_to do |format|
      if @seller_property.update_attributes(params[:seller_property])
        format.html { redirect_to(@seller_property, :notice => 'Seller property was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seller_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seller_properties/1
  # DELETE /seller_properties/1.xml
  def destroy
    @seller_property = SellerProperty.find(params[:id])
    @seller_property.destroy

    respond_to do |format|
      format.html { redirect_to(seller_properties_url) }
      format.xml  { head :ok }
    end
  end
end
