class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    if current_user.purchases.any?
      @history = current_user.purchases.order(created_at: :desc)
    end
    @groups = current_user.groups
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.valid?
      @profile.user = current_user
      @profile.save
      respond_with(@profile)
    else
      render :new
    end
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :phone, :user_id)
    end
end
