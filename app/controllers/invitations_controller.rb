class InvitationsController < ApplicationController
  # GET /invitations
  # GET /invitations.json
  before_filter :load_current_group, only: [:new, :create]
  def index
   
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
    
  end

  # GET /invitations/new
  # GET /invitations/new.json
  def new
    @invitation = Invitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitation }
    end
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.json
  def create
    @invitation = Invitation.new(params[:invitation] )
    emails=@invitation.invited_members.split()
    @invitation.token = SecureRandom.urlsafe_base64
    @invitation.sent_at=Time.now
    @invitation.sender_id=@group.id
    @invitation.audit_comment="Send Invitation";
      if @invitation.save!
        emails.each {|x| 
    UserMailer.invitation(x,new_signup_invitation_url(@invitation.token),@group).deliver 
    }
        flash[:notice]="Thank you, Invitation sent"
        redirect_to @group
      else
        render :new
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.json
  def update
    @invitation = Invitation.find(params[:id])
    
    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to @invitation, notice: 'Invitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :no_content }
    end
  end
  def load_current_group
      @group = Group.find(params[:group_id])
    end
end
