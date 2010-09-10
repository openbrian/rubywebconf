class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def show
    user = User.find_by_name! params[:id]
    @tweets = user.tweets
    render :action => 'index'
  end
end
