require 'spec_helper'

describe "pastevents/index" do
  before(:each) do
    assign(:pastevents, [
      stub_model(Pastevent,
        :user_id => 1,
        :orgname => "Orgname",
        :location => "Location",
        :hours => 1.5,
        :adminname => "Adminname",
        :email => "Email",
        :approval => false
      ),
      stub_model(Pastevent,
        :user_id => 1,
        :orgname => "Orgname",
        :location => "Location",
        :hours => 1.5,
        :adminname => "Adminname",
        :email => "Email",
        :approval => false
      )
    ])
  end

  it "renders a list of pastevents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Orgname".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Adminname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
