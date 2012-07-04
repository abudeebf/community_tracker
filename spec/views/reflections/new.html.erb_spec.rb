require 'spec_helper'

describe "reflections/new" do
  before(:each) do
    assign(:reflection, stub_model(Reflection,
      :r_id => 1,
      :u_reflection => "MyText"
    ).as_new_record)
  end

  it "renders new reflection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reflections_path, :method => "post" do
      assert_select "input#reflection_r_id", :name => "reflection[r_id]"
      assert_select "textarea#reflection_u_reflection", :name => "reflection[u_reflection]"
    end
  end
end
