class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :show, :update]

  def index
  end

  def show
    @tweets = Tweet.where(user_id: current_user.id).order("id DESC")
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to :root
    else
      redirect_to edit_user_path
      alert_user_edit_error_message
    end
  end

 private
  def user_params
    params.require(:user).permit(:name, :email,:group_id, :profile, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
