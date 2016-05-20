require 'rails_helper'
require 'spec_helper'

RSpec.describe BeersController, :type => :controller do
  describe "GET index" do
    it "renders the beers index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "renders the beers show template" do
      get :show
      expect(response).to redirect_to(:action => 'show'
    end
  end

  describe "GET new" do
    it "renders the beers new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    it "renders the edit beer template" do
      get :edit
      expect(response).to render_template("edit") 
    end
  end

 
end
