class BranchtestsController < ApplicationController
  # GET /branchtests
  # GET /branchtests.json
  def index
    @branchtests = Branchtest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @branchtests }
    end
  end

  # GET /branchtests/1
  # GET /branchtests/1.json
  def show
    @branchtest = Branchtest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branchtest }
    end
  end

  # GET /branchtests/new
  # GET /branchtests/new.json
  def new
    @branchtest = Branchtest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @branchtest }
    end
  end

  # GET /branchtests/1/edit
  def edit
    @branchtest = Branchtest.find(params[:id])
  end

  # POST /branchtests
  # POST /branchtests.json
  def create
    @branchtest = Branchtest.new(params[:branchtest])

    respond_to do |format|
      if @branchtest.save
        format.html { redirect_to @branchtest, notice: 'Branchtest was successfully created.' }
        format.json { render json: @branchtest, status: :created, location: @branchtest }
      else
        format.html { render action: "new" }
        format.json { render json: @branchtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /branchtests/1
  # PUT /branchtests/1.json
  def update
    @branchtest = Branchtest.find(params[:id])

    respond_to do |format|
      if @branchtest.update_attributes(params[:branchtest])
        format.html { redirect_to @branchtest, notice: 'Branchtest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @branchtest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branchtests/1
  # DELETE /branchtests/1.json
  def destroy
    @branchtest = Branchtest.find(params[:id])
    @branchtest.destroy

    respond_to do |format|
      format.html { redirect_to branchtests_url }
      format.json { head :no_content }
    end
  end
end
