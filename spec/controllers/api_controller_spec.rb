require 'rails_helper'
require 'spec_helper'

RSpec.describe ApiController, :type => :controller do
  describe "GET beers" do
    it "renders the beers api" do
      get :beers
      expect(response).to render_template("beers")
    end
  end
end
