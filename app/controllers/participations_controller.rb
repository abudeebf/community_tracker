class ParticipationsController < ApplicationController
  # GET /participations
  # GET /participations.json
  def index
    @participations = Participation.all
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participations }
    end
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
    @participation = Participation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participation }
    end
  end

  # GET /participations/new
  # GET /participations/new.json
  def new
    @event=Event.find(params[:event_id])
    @participation =current_user.participations.build(start_time: @event.starttime,end_time:@event.endtime,approval:false, event_id:@event.id,attend:true)
    @participation.audit_comment="join Event"
    x=Participation.where("event_id=? And user_id=?",@event,current_user.id)
    if x.nil? || x.empty?
      respond_to do |format|
      if @participation.save
        format.html { redirect_to @event, notice: 'Participation successful' }
        format.json { render json: @participation, status: :created, location: @participation }
      else
       format.html { redirect_to @event, notice: 'Participation is wrong' }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
    else
   @participation=Participation.find(x[0].id)
   @participation.audit_comment="unjoin event"
   @participation.destroy
  redirect_to @event, notice: 'your not participaant any more' 
    end
  end

  # GET /participations/1/edit
  def edit
   
    @event = Event.find(params[:id])
    @users=@event.users
    @participations=@event.participations
end

  # POST /participations
  # POST /participations.json
  def create
   
    
  end

  # PUT /participations/1
  # PUT /participations/1.json
  def update
    
    respond_to do |format|
      if Participation.update(params[:participations].keys, params[:participations].values)
         @event=Event.find(params[:id])
         @users=@event.users
          @users.each { |user|
        UserMailer.update_hourtracker(user,users_hourtracker_url(user)).deliver 
         @membership=Membership.find(:all, :conditions => [ "group_id = ? and user_id=?", @event.group_id,user.id])
         @participation=Participation.find(:all, :conditions => [ "event_id = ? and user_id=?", @event.id,user.id])
         logger.info('Participation' + @participation.inspect)

         total_hours=(@participation[0].end_time.to_f - @participation[0].start_time.to_f)/3600
         logger.info("total hours" + total_hours.inspect)
         if ! @membership[0].total_hours.nil?
         total_hours+=@membership[0].total_hours 
          end
          @membership[0].update_attributes(total_hours: total_hours)
         }
        format.html { redirect_to @event, notice: 'Participation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json
  def destroy
     
    respond_to do |format|
      format.html { redirect_to @event }
      format.json { head :no_content }
    end
  end
  def confirm_participants
    @event=Event.find(params[:event].to_i)
   for i in 0..(params[:users].length.to_i - 1)
     @participation=Participation.find(:all, :conditions => [ "event_id = ? and user_id=?", (params[:event]).to_i,(params[:users][i]).to_i])
     if (params[:attend][i]=="true")
      @participation[0].attend=true
    else
      @participation[0].attend=false
    end
     @participation[0].approval=true
     @participation[0].start_time=params[:starttime][i]
     @participation[0].end_time=params[:endtime][i]
     if @participation[0].save!
      user=User.find(params[:users][i])
      UserMailer.update_hourtracker(user,users_hourtracker_url(user)).deliver 
    end
   end
   @correct=true
   respond_to do |format|
      format.json { render json: @correct }
    end
end
end
