class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :retrive_user , only:[:new]
  before_filter :signed_in_user, only:[:edit,:update,:destroy]
  before_filter :correct_user, only:[:edit,:update,:destroy]
  before_filter :check_activation, only: [:show]
  before_filter :correct_user_privacy ,only:[:show]
  

  def index
    @cat=params[:cat]
   if params[:cat]=="People" 
     if params[:search].empty? ||  params[:search].nil?
      @users=User.find(:all,:conditions =>['privacy=?',false])
    else
    @users = User.find(:all, :conditions => ['first_name LIKE ? or last_name LIKE ? and privacy=? ', "%#{params[:search]}%","%#{params[:search]}%",false])
  end 
  elsif params[:cat]=="Events"
    @events= Event.find(:all, :conditions => ['title LIKE ? or category LIKE ? ', "%#{params[:search]}%","%#{params[:search]}%"])
  else
   @groups=Group.find(:all, :conditions => ['name LIKE ? ', "%#{params[:search]}%"])
    end 
    params[:cat]=""
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
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
    @user.confirmation = false
    @user.audit_comment="Create User"
    @user.token =SecureRandom.urlsafe_base64
    logger.info(@user.inspect)
    respond_to do |format|
      if @user.save
         UserMailer.registration_confirmation(@user,user_url(@user.token)).deliver 
         
         if !session[:group_id].nil?
           @user.joingroup!(session[:group_id] ,"Member")  
           session.delete(:group_id)
          end
       
        format.html { redirect_to root_path, notice: 'Please check your inbox for activation link' }
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
     @user.audit_comment="Update User"
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
   def hourtracker
    @types=params[:types]
    if @types.nil? || @types.empty?
     params[:types]="All"
     @types="All"
    end
    @user = User.find(params[:id])
    if params[:types]=="All"
      @participations=@user.participations.paginate(page:params[:page])
      @pastevents= @user.pastevents
    elsif params[:types]=="Approved"
      @participations=@user.participations.where('attend=? and approval=?',true,true).paginate(page:params[:page])
       @pastevents= @user.pastevents.where('approval=?',true)
    elsif params[:types]=="Waiting"
       @participations=@user.participations.where('attend=? and approval=?',true,false).paginate(page:params[:page])
      @pastevents= @user.pastevents.where(:approval=>nil)
    else
      @types='not approved'
      @participations=@user.participations.where('attend=? and approval=?',false,true).paginate(page:params[:page])
      @pastevents= @user.pastevents.where('approval=?',false)
    end

   end

   def communitykarma
    @user = User.find(params[:id])
    @membership=@user.memberships.paginate(page:params[:page])
   end

  private
 def correct_user
  @user = User.find(params[:id])
  redirect_to root_path unless current_user?(@user)
 end
 def correct_user_privacy
  @user = User.find(params[:id])
  redirect_to root_path unless current_user?(@user)|| @user.privacy==false || groupsadmins(@user)==true
 end
  def retrive_user
    if ! params[:invitation_id].nil?
      @invitation= Invitation.find_by_token!(params[:invitation_id])
      session[:group_id]=@invitation.sender_id
    end
  end
  def groupsadmins(user)
    allow=false
    if !current_user.nil?
    user.memberships.each do |groupmember|
      current_user.memberships.each do |membership|
      if (membership.group_id == groupmember.group_id) && (membership.member=="Creator" || membership.member=="Admin")
           logger.info ("Fatima")
           allow=true
           break
         end
         if allow==true
          break
        end
       end
     end 
   end
     return allow
   end

   def check_activation
      @user= User.find_by_token(params[:id])
      
      if @user.nil? 
        @user=User.find(params[:id])
        redirect_to root_path unless @user.confirmation==true
      else
         @user.confirmation=true
         params[:id]=@user.id
          @user.save
         sign_in @user

      
      end
     
   end

end
