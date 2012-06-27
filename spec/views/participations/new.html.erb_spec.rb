require 'spec_helper'

describe "participations/new" do
  before(:each) do
    assign(:participation, stub_model(Participation,
      :user_id => 1,
      :event_id => 1,
      :approval => false
    ).as_new_record)
  end

  it "renders new participation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => participations_path, :method => "post" do
      assert_select "input#participation_user_id", :name => "participation[user_id]"
      assert_select "input#participation_event_id", :name => "participation[event_id]"
      assert_select "input#participation_approval", :name => "participation[approval]"
    end
  end
end
