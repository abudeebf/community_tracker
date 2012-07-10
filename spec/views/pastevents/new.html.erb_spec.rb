require 'spec_helper'

describe "pastevents/new" do
  before(:each) do
    assign(:pastevent, stub_model(Pastevent,
      :user_id => 1,
      :orgname => "MyString",
      :location => "MyString",
      :hours => 1.5,
      :adminname => "MyString",
      :email => "MyString",
      :approval => false
    ).as_new_record)
  end

  it "renders new pastevent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pastevents_path, :method => "post" do
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
