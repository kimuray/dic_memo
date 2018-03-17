class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def dashboard
  end

  def edit
  end

  def update
    if @user.update(users_params)
      redirect_to edit_user_path(@user), notice: I18n.t("notice.users.update")
    else
      render 'edit'
    end
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :image, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
