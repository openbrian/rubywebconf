require 'spec_helper'

describe TweetsController, 'GET index' do
  it "finds all of the tweets and assigns them to the view" do
    Tweet.stub(:all).and_return [:tweet1, :tweet2]
    get :index
    assigns[:tweets].should == [:tweet1, :tweet2]
  end
end

describe TweetsController, 'GET show' do
  before do
    User.stub(:find_by_name!).and_return user
  end

  let!(:user) { stub('user', :tweets => [:bjs_tweet1, :bjs_tweet2]) }
  
  it "looks up the user and his tweets" do
    User.should_receive(:find_by_name!).with('bj').and_return user
    get :show, :id => 'bj'
    assigns[:tweets].should == [:bjs_tweet1, :bjs_tweet2]
  end

  it "renders the index template" do
    get :show, :id => 'bj'
    response.should render_template('index')
  end
end
