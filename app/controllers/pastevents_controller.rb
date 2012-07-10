class PasteventsController < ApplicationController
  # GET /pastevents
  # GET /pastevents.json
  def index
    @pastevents = Pastevent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pastevents }
    end
  end

  # GET /pastevents/1
  # GET /pastevents/1.json
  def show
    @pastevent = Pastevent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pastevent }
    end
  end

  # GET /pastevents/new
  # GET /pastevents/new.json
  def new
    @pastevent = Pastevent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pastevent }
    end
  end

  # GET /pastevents/1/edit
  def edit
    @pastevent = Pastevent.find(params[:id])
  end

  # POST /pastevents
  # POST /pastevents.json
  def create
    @pastevent = Pastevent.new(params[:pastevent])

    respond_to do |format|
      if @pastevent.save
        format.html { redirect_to @pastevent, notice: 'Pastevent was successfully created.' }
        format.json { render json: @pastevent, status: :created, location: @pastevent }
      else
        format.html { render action: "new" }
        format.json { render json: @pastevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pastevents/1
  # PUT /pastevents/1.json
  def update
    @pastevent = Pastevent.find(params[:id])

    respond_to do |format|
      if @pastevent.update_attributes(params[:pastevent])
        format.html { redirect_to @pastevent, notice: 'Pastevent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pastevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pastevents/1
  # DELETE /pastevents/1.json
  def destroy
    @pastevent = Pastevent.find(params[:id])
    @pastevent.destroy

    respond_to do |format|
      format.html { redirect_to pastevents_url }
      format.json { head :no_content }
    end
  end
end
