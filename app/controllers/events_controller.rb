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
    eventurl= []
    @event.user = current_user
    @event.audit_comment="Create Event"
    if @event.recurring
      @event.save
      @event2 =@event

      eventurl+= [event_show_url(@event)]

      aftereventsave(Group.find(@event.group_id),@event)
      num_weeks = (((@event.recurring_ends - DateTime.now).to_f) / 604800).to_i
      for i in 2..num_weeks
        @event=eventChanger(@event,@group)
        @event.save
        aftereventsave(Group.find(@event.group_id),@event) 
        eventurl+= [event_show_url(@event)]  
      end
       @users.each { |user|
      UserMailer.recurringeventemail(@event2,eventurl,user).deliver  }
      x = num_weeks.inspect +  " Events were successfully created."
      redirect_to @event, notice: x
   else
         
    respond_to do |format|
      if @event.save
        aftereventsave(Group.find(@event.group_id),@event)
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
end
  # PUT /events/1
  # PUT /events/1.json
  def update
   @event=Event.find(params[:id])
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

  def eparticipant
     
     @event=Event.where('user_id=? and id=?',params[:euser],params[:eventtitle])
     @event.each do |event|
      @x=event
    end
    if !@x.nil?
     @users=@x.participations
     @users.each do |user|
      user[:name]=User.find(user.user_id).first_name + " "+User.find(user.user_id).last_name
     end

     @j={user: @users}
      
      else
         @j={user: 'none'}
    end
    respond_to do |format|
      format.json { render json: @j }
    end
  end

  
  private

    def load_current_group
      @group = Group.find(params[:group_id])
    end
    
    def eventChanger event,group
     recurringevent=group.events.build()
      recurringevent.user=current_user
      recurringevent.title=event.title
      recurringevent.description=event.description
      recurringevent.category=event.category
      recurringevent.location=event.location
      recurringevent.recurring=true
      recurringevent.starttime=event.starttime+ 7.days
      recurringevent.endtime=event.endtime + 7.days
      recurringevent.recurring_ends=event.recurring_ends
      return recurringevent
    end
  def aftereventsave(group,event)
    group=Group.find(event.group_id)
    @participation =current_user.participations.build(start_time: event.starttime,end_time:event.endtime,approval:false, event_id:event.id,attend:true,audit_comment:"join Event")
    @participation.save
    @users=@group.users
  end


end

