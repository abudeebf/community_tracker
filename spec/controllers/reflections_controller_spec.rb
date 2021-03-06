require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ReflectionsController do

  # This should return the minimal set of attributes required to create a valid
  # Reflection. As you add validations to Reflection, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReflectionsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all reflections as @reflections" do
      reflection = Reflection.create! valid_attributes
      get :index, {}, valid_session
      assigns(:reflections).should eq([reflection])
    end
  end

  describe "GET show" do
    it "assigns the requested reflection as @reflection" do
      reflection = Reflection.create! valid_attributes
      get :show, {:id => reflection.to_param}, valid_session
      assigns(:reflection).should eq(reflection)
    end
  end

  describe "GET new" do
    it "assigns a new reflection as @reflection" do
      get :new, {}, valid_session
      assigns(:reflection).should be_a_new(Reflection)
    end
  end

  describe "GET edit" do
    it "assigns the requested reflection as @reflection" do
      reflection = Reflection.create! valid_attributes
      get :edit, {:id => reflection.to_param}, valid_session
      assigns(:reflection).should eq(reflection)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reflection" do
        expect {
          post :create, {:reflection => valid_attributes}, valid_session
        }.to change(Reflection, :count).by(1)
      end

      it "assigns a newly created reflection as @reflection" do
        post :create, {:reflection => valid_attributes}, valid_session
        assigns(:reflection).should be_a(Reflection)
        assigns(:reflection).should be_persisted
      end

      it "redirects to the created reflection" do
        post :create, {:reflection => valid_attributes}, valid_session
        response.should redirect_to(Reflection.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reflection as @reflection" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reflection.any_instance.stub(:save).and_return(false)
        post :create, {:reflection => {}}, valid_session
        assigns(:reflection).should be_a_new(Reflection)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reflection.any_instance.stub(:save).and_return(false)
        post :create, {:reflection => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reflection" do
        reflection = Reflection.create! valid_attributes
        # Assuming there are no other reflections in the database, this
        # specifies that the Reflection created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Reflection.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => reflection.to_param, :reflection => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested reflection as @reflection" do
        reflection = Reflection.create! valid_attributes
        put :update, {:id => reflection.to_param, :reflection => valid_attributes}, valid_session
        assigns(:reflection).should eq(reflection)
      end

      it "redirects to the reflection" do
        reflection = Reflection.create! valid_attributes
        put :update, {:id => reflection.to_param, :reflection => valid_attributes}, valid_session
        response.should redirect_to(reflection)
      end
    end

    describe "with invalid params" do
      it "assigns the reflection as @reflection" do
        reflection = Reflection.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reflection.any_instance.stub(:save).and_return(false)
        put :update, {:id => reflection.to_param, :reflection => {}}, valid_session
        assigns(:reflection).should eq(reflection)
      end

      it "re-renders the 'edit' template" do
        reflection = Reflection.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reflection.any_instance.stub(:save).and_return(false)
        put :update, {:id => reflection.to_param, :reflection => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reflection" do
      reflection = Reflection.create! valid_attributes
      expect {
        delete :destroy, {:id => reflection.to_param}, valid_session
      }.to change(Reflection, :count).by(-1)
    end

    it "redirects to the reflections list" do
      reflection = Reflection.create! valid_attributes
      delete :destroy, {:id => reflection.to_param}, valid_session
      response.should redirect_to(reflections_url)
    end
  end

end
