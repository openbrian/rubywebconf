require 'spec_helper'

describe MainController do

  it "shows yay it works on the home page" do
    get :home
    response.body.should include("Yay it works!")
  end

end
