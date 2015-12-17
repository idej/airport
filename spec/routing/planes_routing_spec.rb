require "rails_helper"

RSpec.describe PlanesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/planes").to route_to("planes#index")
    end

    it "routes to #new" do
      expect(:get => "/planes/new").to route_to("planes#new")
    end

    it "routes to #show" do
      expect(:get => "/planes/1").to route_to("planes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/planes/1/edit").to route_to("planes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/planes").to route_to("planes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/planes/1").to route_to("planes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/planes/1").to route_to("planes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/planes/1").to route_to("planes#destroy", :id => "1")
    end

  end
end
