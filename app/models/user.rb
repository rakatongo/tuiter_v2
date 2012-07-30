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

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  before_save { |user| user.email = email.downcase }


  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates  :name, presence: true, length: { maximum: 50}
  validates :email, presence: true, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }
  validates :password_confirmation, :password_confirmation, length: { minimum: 6 }, presence: true
end
