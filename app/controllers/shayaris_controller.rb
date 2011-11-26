class ShayarisController < ApplicationController
  # GET /shayaris
  # GET /shayaris.xml
  def index
   
    if(params[:category] && params[:category] != "All Categories")
      @shayaris = Shayari.where('category = ?', params[:category]).order('updated_at DESC')
    else
      @shayaris = Shayari.where('id != 0').order('updated_at DESC')
    end
    #p "#{@shayaris.each {|val| p val}} priyank"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shayaris }
    end
  end

  # GET /shayaris/1
  # GET /shayaris/1.xml
  def show
    @shayari = Shayari.find(params[:id])
    @comments = @shayari.comments.recent.limit(10).all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shayari }
    end
  end

  # GET /shayaris/new
  # GET /shayaris/new.xml
  def new
    @shayari = Shayari.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shayari }
    end
  end

  # GET /shayaris/1/edit
  def edit
    @shayari = Shayari.find(params[:id])
  end

  # POST /shayaris
  # POST /shayaris.xml
  def create
    shayari_data = params[:shayari]
    shayari_data[:user_id] = session[:user_id]
    @shayari = Shayari.new(shayari_data)
    
    respond_to do |format|
      if @shayari.save
        format.html { redirect_to(@shayari, :notice => 'Shayari was successfully created.') }
        format.xml  { render :xml => @shayari, :status => :created, :location => @shayari }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shayari.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shayaris/1
  # PUT /shayaris/1.xml
  def update
    @shayari = Shayari.find(params[:id])
    
    unless(@shayari.user_id === session[:user_id])
      redirect_to(shayaris_path)
    end
    respond_to do |format|
      if @shayari.update_attributes(params[:shayari])
        format.html { redirect_to(@shayari, :notice => 'Shayari was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shayari.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shayaris/1
  # DELETE /shayaris/1.xml
  def destroy
    @shayari = Shayari.find(params[:id])
    @shayari.destroy

    respond_to do |format|
      format.html { redirect_to(shayaris_url) }
      format.xml  { head :ok }
    end
  end
end
