require 'spec_helper'

describe "pastevents/edit" do
  before(:each) do
    @pastevent = assign(:pastevent, stub_model(Pastevent,
      :user_id => 1,
      :orgname => "MyString",
      :location => "MyString",
      :hours => 1.5,
      :adminname => "MyString",
      :email => "MyString",
      :approval => false
    ))
  end

  it "renders the edit pastevent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pastevents_path(@pastevent), :method => "post" do
      assert_select "input#pastevent_user_id", :name => "pastevent[user_id]"
      assert_select "input#pastevent_orgname", :name => "pastevent[orgname]"
      assert_select "input#pastevent_location", :name => "pastevent[location]"
      assert_select "input#pastevent_hours", :name => "pastevent[hours]"
      assert_select "input#pastevent_adminname", :name => "pastevent[adminname]"
      assert_select "input#pastevent_email", :name => "pastevent[email]"
      assert_select "input#pastevent_approval", :name => "pastevent[approval]"
    end
  end
end
