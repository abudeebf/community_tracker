require 'spec_helper'

describe "reflections/edit" do
  before(:each) do
    @reflection = assign(:reflection, stub_model(Reflection,
      :r_id => 1,
      :u_reflection => "MyText"
    ))
  end

  it "renders the edit reflection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reflections_path(@reflection), :method => "post" do
      assert_select "input#reflection_r_id", :name => "reflection[r_id]"
      assert_select "textarea#reflection_u_reflection", :name => "reflection[u_reflection]"
    end
  end
end
