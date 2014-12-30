class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :leave_group]
  respond_to :html

  def leave_group
    membership = Membership.find_by(group: @group, user: current_user)
    membership.destroy
    redirect_to profile_path(current_user.profile)
  end

  def index
    @groups = Group.all
    respond_with(@groups)
  end

  def show
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @membership = Membership.new
    @membership.user = current_user
    @membership.group = @group
    @membership.save
    @group.save
    @group.invitations.each do |send_invite|
        User.invite!({:email => send_invite.email}, current_user)
    end
    respond_with(@group, location: profile_path(current_user.profile))
  end

  def update
    @group.update(group_params)
    @group.invitations.each do |send_invite|
        User.invite!({:email => send_invite.email}, current_user)
    end
    respond_with(@group, location: profile_path(current_user.profile))
  end

  def destroy
    @group.destroy
    respond_with(@group, location: profile_path(current_user.profile))
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, invitations_attributes: [:id, :email, :_destroy])
    end
end
