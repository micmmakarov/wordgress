class VocsController < ApplicationController
  # GET /vocs
  # GET /vocs.json
  def index
    @vocs = Voc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vocs }
    end
  end

  # GET /vocs/1
  # GET /vocs/1.json
  def show
    @voc = Voc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voc }
    end
  end

  # GET /vocs/new
  # GET /vocs/new.json
  def new
    @voc = Voc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voc }
    end
  end

  # GET /vocs/1/edit
  def edit
    @voc = Voc.find(params[:id])
  end

  # POST /vocs
  # POST /vocs.json
  def create
    @voc = Voc.new(params[:voc])
    @voc.user_id = current_user.id

    respond_to do |format|
      if @voc.save
        format.html { redirect_to @voc, notice: 'Voc was successfully created.' }
        format.json { render json: @voc, status: :created, location: @voc }
      else
        format.html { render action: "new" }
        format.json { render json: @voc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vocs/1
  # PUT /vocs/1.json
  def update
    @voc = Voc.find(params[:id])
    @voc.user_id = current_user.id
    respond_to do |format|
      if @voc.update_attributes(params[:voc])
        format.html { redirect_to @voc, notice: 'Voc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @voc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocs/1
  # DELETE /vocs/1.json
  def destroy
    @voc = Voc.find(params[:id])
    @voc.destroy

    respond_to do |format|
      format.html { redirect_to vocs_url }
      format.json { head :no_content }
    end
  end

  def toggle
    puts params[:id]
    @word = Word.find(params[:id])
    current_user.toggle(@word)
    render "home/remember.js"

  end

end
