class RelocatesController < ApplicationController
  # GET /relocates
  # GET /relocates.json
  def index
    @relocates = Relocate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relocates }
    end
  end

  # GET /relocates/1
  # GET /relocates/1.json
  def show
    @relocate = Relocate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @relocate }
    end
  end

  # GET /relocates/new
  # GET /relocates/new.json
  def new
    @relocate = Relocate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @relocate }
    end
  end

  # GET /relocates/1/edit
  def edit
    @relocate = Relocate.find(params[:id])
  end

  # POST /relocates
  # POST /relocates.json
  def create
    @relocate = Relocate.new(params[:relocate])

    respond_to do |format|
      if @relocate.save
        format.html { redirect_to @relocate, notice: 'Relocate was successfully created.' }
        format.json { render json: @relocate, status: :created, location: @relocate }
      else
        format.html { render action: "new" }
        format.json { render json: @relocate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /relocates/1
  # PUT /relocates/1.json
  def update
    @relocate = Relocate.find(params[:id])

    respond_to do |format|
      if @relocate.update_attributes(params[:relocate])
        format.html { redirect_to @relocate, notice: 'Relocate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @relocate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relocates/1
  # DELETE /relocates/1.json
  def destroy
    @relocate = Relocate.find(params[:id])
    @relocate.destroy

    respond_to do |format|
      format.html { redirect_to relocates_url }
      format.json { head :no_content }
    end
  end
end
