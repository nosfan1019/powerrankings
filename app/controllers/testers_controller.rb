class TestersController < ApplicationController
  # GET /testers
  # GET /testers.json
  def index
    @testers = Tester.all

  end

  # GET /testers/1
  # GET /testers/1.json
  def show
    @tester = Tester.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tester }
    end
  end

  # GET /testers/new
  # GET /testers/new.json
  def new
    @tester = Tester.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # GET /testers/1/edit
  def edit
    @tester = Tester.find(params[:id])
  end

  # POST /testers
  # POST /testers.json
  def create
    @tester = Tester.create!(params[:tester])

    redirect_to testers_url


  end

  # PUT /testers/1
  # PUT /testers/1.json
  def update
    @tester = Tester.find(params[:id])

    respond_to do |format|
      if @tester.update_attributes(params[:tester])
        format.html { redirect_to testers_url, notice: 'Tester was successfully updated.' }

      else
        format.html { render action: "edit" }
        format.json { render json: @tester.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /testers/1
  # DELETE /testers/1.json
  def destroy
    @tester = Tester.find(params[:id])
    @tester.destroy

    respond_to do |format|
      format.html { redirect_to testers_url }
      format.json { head :no_content }
    end
  end

  def ryan
    if @tester.save 
        redirect_to @tester, notice: 'Tester was successfully updated.'
    end  
  end

  def testajax
    @tester = Tester.first

    respond_to do |format|
        format.js     
    end
  end
end
