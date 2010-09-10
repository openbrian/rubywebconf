require 'spec_helper'

describe User do
  let!(:me) { User.create! :name => 'pat' }
  
  describe "#followed_tweets" do
    let!(:other_user) { User.create! :name => 'ro' }
    let!(:tweet) { other_user.tweets.create! :body => "This is ro's tweet" }

    context "when following another user" do
      before do
        me.follow other_user
      end
      
      it 'includes tweets from someone I follow' do
        me.followed_tweets.should include(tweet)
      end
      
      it "includes the user's name in the tweet body" do
        me.followed_tweets.first.body.should == "This is ro's tweet - @ro"
      end

      it "includes my own tweets" do
        my_tweet = me.tweets.create! :body => "This is my tweet"
        me.followed_tweets.should include(my_tweet, tweet)
      end
      
      it "sorts tweets by created_at" do
        my_tweet = me.tweets.create! :body => "This is my tweet"
        me.followed_tweets.should == [my_tweet, tweet]
      end
      
    end
        
    it "excludes tweets from someone I don't follow" do
      me.followed_tweets.should_not include(tweet)
    end
  end
  
  describe "#followed_users" do
    it "includes users I follow" do
      user = User.create! :name => 'ro'
      Follow.create! :follower => me, :followee => user
      me.followed_users.should include(user)
    end
  end
end
