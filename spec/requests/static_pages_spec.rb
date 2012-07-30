require 'spec_helper'

describe "StaticPages" do
	subject { page }
	let(:base_title){ "Tuiter_v2" }

	shared_examples_for "all_pages" do
		it { should have_selector 'h1', text: heading}
		it { should have_selector 'title', text: full_title(page_title)}
	end
	describe "Home page" do
		before { visit root_path }
		let(:heading){ "Bienvenido" }
		let(:page_title){ ""}

		it_should_behave_like "all_pages"	
		it { should_not have_selector 'title', text: full_title('Home') }		
	end
	describe "Help page" do
		before { visit help_path }
		let(:heading){ "Help"}
		let(:page_title){ "Help"}
		it_should_behave_like "all_pages"
	end
	describe "About page" do
		before { visit about_path }
		let(:heading){ "About" }
		let(:page_title){ "About" }
		it_should_behave_like "all_pages"
	end
	describe "Contact page" do
		before { visit contact_path }
		let(:heading){ "Contacto" }
		let(:page_title){ "Contacto"}
		it_should_behave_like "all_pages"
	end
end
