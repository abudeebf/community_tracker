class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
   before_filter :signed_in_user , only:[:edit,:update,:destroy,:create,:new]
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show

    @group = Group.find(params[:id])
    @users=@group.users
    @events= @group.events.paginate(page:params[:page])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new
    @user=current_user
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end
  
  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])
    @group.user_id= current_user.id
    respond_to do |format|
       @group.audit_comment="Create Group"
      if @group.save
       current_user.joingroup!(@group.id,"Creator")
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }

      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
     @group.audit_comment="Update Group"
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end
  def join
    @group=Group.find(params[:id])
    
    respond_to do |format|
      if  current_user.joingroup!(@group.id,"Member")
        format.html { redirect_to @group, notice: 'You have successfully joined the group ' }
        format.json { render json: @group, status: :created, location: @group }
      else
       format.html { redirect_to @group, notice: 'Join not successfull' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
     end
  end

end
