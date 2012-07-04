require 'spec_helper'

describe "reflections/show" do
  before(:each) do
    @reflection = assign(:reflection, stub_model(Reflection,
      :r_id => 1,
      :u_reflection => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
