require 'spec_helper'

describe "StaticPages" do
	let(:base_title){ "Tuiter Reloaded"}
	describe "Home page" do
		it "should not have right title" do
			visit '/static_pages/home'
			page.should_not have_selector('title',text: "#{base_title} | Home")
		end
		it "should have the right title" do
			visit '/static_pages/home'
			page.should have_selector('title', text: "#{base_title}")
		end
		it "should have the h1 selector" do
			visit '/static_pages/home'
			page.should have_selector('h1', text: "Home")
		end
	end
	describe "Help page" do
		it "should have the right title" do
			visit '/static_pages/help'
			page.should have_selector('title', text: "#{base_title} | Help")
		end
		it "should have the h1 selector" do
			visit '/static_pages/help'
			page.should have_selector('h1', text: 'Help')
		end
	end
	describe "About page" do
		it "should have the right title" do
			visit '/static_pages/about'
			page.should have_selector('title', text: "#{base_title} | About")
		end
		it "should have the h1 selector" do
			visit '/static_pages/about'
			page.should have_selector('h1', text: 'About')
		end
	end
end
