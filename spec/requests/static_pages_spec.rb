require 'spec_helper'

describe "Static Pages" do
 describe "Home Page"  do
 	it "should have the h1 'Community Tracker'" do
 	   visit root_path
 	    page.should have_selector('h1',text:'Community Tracker')
    end
    it "should have the right title" do
 	   visit root_path
 	    page.should have_selector('title',text:'Community Tracker |Home')
 	end
end 
describe "About us"  do
 	it "should have the h1 'About us'" do
 	   visit aboutus_path
 	     page.should have_selector('h1',text:'About us')
    end
    it "should have the right title" do
 	   visit '/static_pages/aboutus'
 	    page.should have_selector('title',text:'Community Tracker |About us')
 	end
end
describe "Stories"  do
 	it "should have the h1 'Stories '" do
 	   visit stories_path
 	    page.should have_selector('h1',text:'Stories')
    end
    it "should have the right title" do
 	   visit stories_path
 	    page.should have_selector('title',text:'Community Tracker |Stories')
 	end
end
describe "Sign up"  do
 	it "should have the h1 'Sign up'" do
 	   visit signup_path
 	    page.should have_selector('h1',text:'Sign up')
    end
    it "should have the right title" do
 	   visit signup_path
 	    page.should have_selector('title',text:'Community Tracker |Sign up')
 	end

end 
end
