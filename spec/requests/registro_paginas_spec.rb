require 'spec_helper'

describe "Login/Logout de Paginas" do
	subject { page }
	describe "Login"  do
		before { visit login_path }
		it { should have_selector'h1', text: 'Log in!' }
		it { should have_selector'title', text: 'Log in!' }
		describe "con informacion invalida" do
			before { click_button "Log in!"}
			it { should have_selector 'div.alert.alert-error', text: 'Invalid'}
			describe "despues de visitar una pagina" do
				before { click_link "Home" }
				it { should_not have_selector'div.alert.alert-error' }
			end
		end
		describe "con informacion valida" do
			let(:user){ FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password 
				click_button "Log in!"
			end
			it { should have_selector'title', text: user.name }
			it { should have_link'Perfil', href: user_path(user) }
			it { should have_link'Log out!', href: logout_path }
			it { should_not have_link'Log in!', href: login_path }
		end
	end  
end
