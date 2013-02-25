require 'spec_helper'

describe SvgController do

  describe "GET 'line'" do
    it "returns http success" do
      get 'line'
      response.should be_success
    end
  end

  describe "GET 'bar'" do
    it "returns http success" do
      get 'bar'
      response.should be_success
    end
  end

end
