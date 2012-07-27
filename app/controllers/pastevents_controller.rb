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
    @user=current_user
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pastevent }
    end
  end

  # GET /pastevents/1/edit
  def edit
    @pastevent = Pastevent.find_by_token!(params[:id])
  end

  # POST /pastevents
  # POST /pastevents.json
  def create
    @pastevent = Pastevent.new(params[:pastevent])
    @pastevent.user = current_user
    @user=current_user
    @pastevent.token = SecureRandom.urlsafe_base64
    respond_to do |format|
      if @pastevent.save
        format.html { redirect_to @pastevent, notice: 'Past event was successfully created.' }
        format.json { render json: @pastevent, status: :created, location: @pastevent }
        UserMailer.pastEventConfirmation(@pastevent).deliver
      else
        format.html { render action: "new" }
        format.json { render json: @pastevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pastevents/1
  # PUT /pastevents/1.json
  def update
    @pastevent =Pastevent.find_by_token!(params[:id])
    user = User.find(@pastevent.user_id)
    @pastevent.approval = true
    respond_to do |format|
      if @pastevent.update_attributes(params[:pastevent])
        UserMailer.update_hourtracker(user,users_hourtracker_url(user)).deliver
        format.html { redirect_to root_path, notice: 'Your decision is recorded successfully. Thank you!' }
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
