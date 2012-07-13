class EventsController < ApplicationController
  before_filter :signed_in_user , only:[:new,:create,:update,:destroy]
  before_filter :load_current_group, only: [:new, :create]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @users=@event.users
    @participations=@event.participations
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = @group.events.build(params[:event])
    @event.user = current_user
    @event.audit_comment="Create Event"
     
    respond_to do |format|
      if @event.save
         @group=Group.find(@event.group_id)
          @participation =current_user.participations.build(start_time: @event.starttime,end_time:@event.endtime,approval:false, event_id:@event.id,attend:true,audit_comment:"join Event")
  @users=@group.users
 @participation.save
  @users.each { |user|
        UserMailer.join_event(@event,event_show_url(@event),user).deliver  }

        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @event.audit_comment="Update Event"
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        redirect_to root_path
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.audit_comment="Destroy Event"
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  private

    def load_current_group
      @group = Group.find(params[:group_id])
    end

end
