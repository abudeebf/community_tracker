require 'spec_helper'
describe "User Pages" do 
	subject {page}
	describe "singup page" do
		before {visit signup_path}
		it {should have selector('h1',text:'Sign up')}
		it { should have_selector('title',text: full_title('Sign up'))}
	end
	describe "profile page" do
		let(:foobar){FactoryGirl.create(:user)}
		before { visit user_path(user)}
	it {should have_selector('h1',text: foobar.name)}
		it { should have_selector('title',foobar:user.name)}
	end

describe "edit" do 
	let(:user){FactoryGirl.create(:user)}
	describe "page" do
		before { visit edit_user_path(user)}
	it {should have_selector ('h1', text:"Update your profile")}
	it {should have_selector ('title',text: "Edit user")}
	it { should have_link ('change',herf: 'http://gravatar.com/emails')}
end
 describe "with invalid information" do
 	before { click_button "Save changes"}
 	it  { should have_content('error')}

 end

end
end