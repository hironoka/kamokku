class TweetsController < ApplicationController
  before_action :set_prototype, :authenticate_user!, only: [:show, :edit]
  before_action :set_user, only: [:show]

  def index
    @user = current_user
    @tweets = Tweet.includes(:user).order("id DESC")
  end

  def new
    @user = current_user
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      redirect_to new_tweet_path
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:tweet, :user_id, :title, :group_id, :piece_id)
    # params.require(:message).permit(:body, :image).merge(group_id: @group.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
