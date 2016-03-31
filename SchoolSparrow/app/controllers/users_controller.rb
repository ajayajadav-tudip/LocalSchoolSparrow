class UsersController < ApplicationController
  def edit_user_profile
  end

  def update_user_profile
    @user = current_user
    if @user.update(user_params)
      flash[:success]='Account_updated'
      redirect_to dashboard_home_path
    else
      render 'users/registrations/edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:password, :email, profile_attributes: [:dob, :phonenumber, :photoupload, :rentvsbuyvsunknown, :whenlookkingfor, :noofbeds, :noofbathrooms, :budget, :noofchildren, :agechild, :decision1, :decision2, :workaddress])
  end

end

# def new
#   @profile = current_user.build_profile
# end
#
# def create
#   @profile = current_user.build_profile(profile_params)
#   if @profile.save
#     flash[:success] = "Profile saved"
#     redirect_to current_user_path
#   else
#     flash[:error] = "Error"
#     render: new
#   end
# end
# def edit
#   @profile = current_user.profile.find(params[:id])
# end
#
# def update
#   @profile = current_user.profile.find(params[:id])
#   if @profile.update_attributes(profile_params)
#     flash[:success] = "Successfully updated"    # Optional
#     redirect_to user_path
#   else
#     flash[:error] = "Error"       # Optional
#     render :edit
#   end
# end