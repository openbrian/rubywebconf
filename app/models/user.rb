class User < ActiveRecord::Base
  has_many :tweets
  has_many :follows, :foreign_key => 'follower_id'
  has_many :followed_users, :through => :follows, :source => :followee
  
  def follow(other_user)
    follows.create! :followee => other_user
  end
  
  def followed_tweets
    other_tweets = followed_users.map(&:tweets).flatten
    other_tweets.each do |tweet|
      def tweet.body
        read_attribute(:body) + " - @#{user.name}"
      end
    end
    (other_tweets + tweets).sort_by(&:created_at).reverse
  end
end
