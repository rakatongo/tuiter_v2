require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "Sign up page" do
  	before { visit registro_path }
  	let(:submit){ "Crear cuenta!" }

  	it { should have_selector 'title', text: full_title('Registro!')}
  	it { should have_selector 'h1', text: "Registro"}
  	describe "with invalid informacion" do
  		it "should not create an account" do
  			expect { click_buttom submit }.not_to change(User, :count)
  		end
  	end
  	describe "with valid informacion" do
  		before do
  			fill_IN "Name", with: "Example user"
  			fill_in "Email", with: "user@example.com"
  			fill_in "Password", with: "alejandro"
  			fill_in "Confirmation", with: "alejandro"
  		end
  		it "should create el usuario" do
  			expect { click_buttom }.to change(User, :count)
  		end
  	end
  end
  describe "Perfil pagina" do
  	let(:user){ FactoryGirl.create(:user) }
  	before { visit user_path(user) }
  	it { should have_selector 'h1', text: user.name }
  	it { should have_selector 'title', text: user.name }
  end
end
