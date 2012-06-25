require 'spec_helper'

describe "invitations/index" do
  before(:each) do
    assign(:invitations, [
      stub_model(Invitation,
        :invited_members => "Invited Members",
        :sender_id => 1
      ),
      stub_model(Invitation,
        :invited_members => "Invited Members",
        :sender_id => 1
      )
    ])
  end

  it "renders a list of invitations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Invited Members".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
