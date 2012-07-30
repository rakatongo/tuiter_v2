require 'spec_helper'

describe "StaticPages" do
	subject { page }
	let(:base_title){ "Tuiter_v2" }
	describe "Home page" do
		before { visit root_path }

		it { should_not have_selector 'title', text: full_title('Home') }
		it { should have_selector 'title', text: full_title('') }
		it { should have_selector 'h1', text: "Bienvenido" }
	end
	describe "Help page" do
		before { visit help_path }

		it { should have_selector 'title', text: full_title("Help")}		
		it { should have_selector 'h1',text: "Help" }
	end
	describe "About page" do
		before { visit about_path }

		it { should have_selector 'title',text: full_title('About') }
		it { should have_selector 'h1', text: "About" }
	end
	describe "Contact page" do
		before { visit contact_path }

		it { should have_selector 'title', text: full_title("Contacto")}
		it { should have_selector 'h1', text: "Contacto" }
	end
end
