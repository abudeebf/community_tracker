require "spec_helper"

describe ReflectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/reflections").should route_to("reflections#index")
    end

    it "routes to #new" do
      get("/reflections/new").should route_to("reflections#new")
    end

    it "routes to #show" do
      get("/reflections/1").should route_to("reflections#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reflections/1/edit").should route_to("reflections#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reflections").should route_to("reflections#create")
    end

    it "routes to #update" do
      put("/reflections/1").should route_to("reflections#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reflections/1").should route_to("reflections#destroy", :id => "1")
    end

  end
end
