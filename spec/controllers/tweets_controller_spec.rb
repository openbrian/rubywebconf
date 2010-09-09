require 'spec_helper'

describe TweetsController, 'GET index' do
  it "finds all of the tweets and assigns them to the view" do
    Tweet.stub(:all).and_return [:tweet1, :tweet2]
    get :index
    assigns[:tweets].should == [:tweet1, :tweet2]
  end
end
