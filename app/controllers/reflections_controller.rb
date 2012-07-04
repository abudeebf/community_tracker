class ReflectionsController < ApplicationController
  # GET /reflections
  # GET /reflections.json
  def index
    @event=Event.find(params[:event_id])
    @participation=@event.participations
    @reflections=[]
     @participation.each do |x|
      if !x.reflection.nil?
 @reflections+=[x.reflection]
end
  end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reflections }
    end
  end

  # GET /reflections/1
  # GET /reflections/1.json
  def show
    @reflection = Reflection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reflection }
    end
  end

  # GET /reflections/new
  # GET /reflections/new.json
  def new
    @event = Event.find(params[:event_id])
    @participation=Participation.where("event_id=? And user_id=?",params[:event_id],current_user.id)
    @participation.each do |x|
      @part_id= x.id
    end
    if !@part_id.nil? 
    @reflection = Reflection.new()
      render action: "new" 
    else 
      flash.now[:error] = 'you can not reflect if you did not participate '
      redirect_to @event
    end
  end

  # GET /reflections/1/edit
  def edit
    @reflection = Reflection.find(params[:id])
  end

  # POST /reflections
  # POST /reflections.json
  def create
 
    
    @reflection = Reflection.new(params[:reflection])
    if @reflection.save
      @event= Event.find(Participation.find(@reflection.r_id).event_id)
     redirect_to event_reflections_path(@event)
      else
      render  "new" 
      end
    end
 

  # PUT /reflections/1
  # PUT /reflections/1.json
  def update
    @reflection = Reflection.find(params[:id])

    respond_to do |format|
      if @reflection.update_attributes(params[:reflection])
        @event= Event.find(Participation.find(@reflection.r_id).event_id)
        format.html { redirect_to event_reflections_path(@event), notice: 'Reflection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reflections/1
  # DELETE /reflections/1.json
  def destroy
    @reflection = Reflection.find(params[:id])

    @reflection.destroy

    respond_to do |format|
       @event= Event.find(Participation.find(@reflection.r_id).event_id)
    
      format.html {  redirect_to event_reflections_path(@event) }
      format.json { head :no_content }
    end
  end
end
