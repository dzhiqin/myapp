class UserProfileController < ApplicationController
  before_action :find_user_and_profile

  def edit

  end

  def update
    if @profile.update(profile_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end
  private

  def find_user_and_profile
    @user = User.find(params[:user_id])
    @profile = @user.profile || @user.create_profile
  end

  def profile_params
    params.require(:profile).permit(:name, :birthday, :address, :education, :occupation, :bref_introduction, :remark)
  end
end
