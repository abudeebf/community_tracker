require "spec_helper"

describe PasteventsController do
  describe "routing" do

    it "routes to #index" do
      get("/pastevents").should route_to("pastevents#index")
    end

    it "routes to #new" do
      get("/pastevents/new").should route_to("pastevents#new")
    end

    it "routes to #show" do
      get("/pastevents/1").should route_to("pastevents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pastevents/1/edit").should route_to("pastevents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pastevents").should route_to("pastevents#create")
    end

    it "routes to #update" do
      put("/pastevents/1").should route_to("pastevents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pastevents/1").should route_to("pastevents#destroy", :id => "1")
    end

  end
end
