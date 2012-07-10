require 'spec_helper'

describe "pastevents/show" do
  before(:each) do
    @pastevent = assign(:pastevent, stub_model(Pastevent,
      :user_id => 1,
      :orgname => "Orgname",
      :location => "Location",
      :hours => 1.5,
      :adminname => "Adminname",
      :email => "Email",
      :approval => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Orgname/)
    rendered.should match(/Location/)
    rendered.should match(/1.5/)
    rendered.should match(/Adminname/)
    rendered.should match(/Email/)
    rendered.should match(/false/)
  end
end
