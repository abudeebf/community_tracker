class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :retrive_user , only:[:new]
  before_filter :signed_in_user, only:[:edit,:update,:destroy]
  before_filter :correct_user, only:[:edit,:update,:destroy]
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
   @groups=@user.groups.paginate(page:params[:page])
   @events=@user.events.paginate(page:params[:page])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
         UserMailer.registration_confirmation(@user).deliver 
         sign_in @user
         if !session[:group_id].nil?
         @user.joingroup!(session[:group_id] ,"Member")  
         session.delete(:group_id)
       end
        format.html { redirect_to @user, notice: 'your account was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'your profile was successfully updated.' }
        format.json { head :no_content }
        sign_in @user
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
 def correct_user
  @user = User.find(params[:id])
  redirect_to root_path unless current_user?(@user)
 end
  def retrive_user
    if ! params[:invitation_id].nil?
      @invitation= Invitation.find(params[:invitation_id])
      session[:group_id]=@invitation.sender_id
    end
  end

end
