class TweetsController < ApplicationController
  before_action :set_prototype, only: [:show, :edit]
  before_action :set_user, only: [:show]

  def index
    @tweets = Tweet.all
    # .includes(:user).page(params[:page]).per(5).order("created_at DESC")
    @tweet = Tweet.new
  end

  def new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to index
    else
      render index
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
    params.require(:tweet).permit(:tweet).merge(group_id: 1)
    # params.require(:message).permit(:body, :image).merge(group_id: @group.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
