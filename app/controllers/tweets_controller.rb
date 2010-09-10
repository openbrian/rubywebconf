class TweetsController < ApplicationController
  def index
    @tweets = lookup_user.followed_tweets
  end
  
  def show
    user = User.find_by_name! params[:id]
    @tweets = user.tweets
    render :action => 'index'
  end
  
  def lookup_user
    User.find_by_name!($username)
  end
end
