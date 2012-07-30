require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "Sign up page" do
  	before { visit registro_path }

  	it { should have_selector 'title', text: full_title('Registro!')}
  	it { should have_selector 'h1', text: "Registro"}
  end
end
