# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'

describe User do
	before { @user = User.new(name: "Ejemplo de usuario", email: "ejemplo@email.com",
		password: "alejandro", password_confirmation: "alejandro")}
	subject { @user }	

	it { should respond_to :name }
	it { should respond_to :email }
	it { should respond_to :password_digest }
	it { should respond_to :password }
	it { should respond_to :password_confirmation }
	it { should be_valid }

	describe "cuando el nombre no esta presente" do
		before { @user.name = "" }
		it { should_not be_valid }
	end
	describe "cuando email no esta presente" do
		before { @user.email = "" }
		it { should be_invalid }
	end
	describe "cuando el nombre es largo" do
		before { @user.name = "a" * 51 }
		it { should be_invalid }
	end
	describe "email sin formatear" do
		before { @user.email = "asdas@asda@asdas" }
		it { should be_invalid }
	end
	describe "email formateado" do
		before { @user.email = "asda@asda.com" }
		it { should be_valid }
	end
	describe "email tiene que ser unico" do
		before do
			user_email = @user.dup
			user_email.save
		end
		it { should be_invalid }
	end
	describe "cuando el password no esta presente" do
		before { @user.password = @user.password_confirmation = " "}
		it { should be_invalid }
	end
	describe "cuando el password no es igual" do
		before { @user.password_confirmation = "otro password" }
		it { should be_invalid }
	end
	describe "cuando el password es demaciado corto" do
		before { @user.password = @user.password_confirmation = "1234"}
		it { should be_invalid }
	end
	describe "retornar valor del metodo authenticate" do
		before { @user.save }
		let(:found_user){ User.find_by_email(@user.email) }
		describe "user con el password correcto" do
			it { should == found_user.authenticate(@user.password) }			
		end
		describe "user con el password erroneo" do
			let(:mal_password){ found_user.authenticate("Otro password")}
			it { should_not == mal_password }
			specify { mal_password.should be_false }
		end
	end
end
