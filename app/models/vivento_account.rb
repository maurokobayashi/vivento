# == Schema Information
#
# Table name: vivento_accounts
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  user_id         :integer          not null
#
class ViventoAccount < ActiveRecord::Base
  attr_accessible :email, :id, :password_digest, :user_id
  
  belongs_to :user

  before_save { |user| user.email = email.downcase }
  
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email,
  :presence => true,
  :length => { :maximum => 150 },
  :format => { :with => VALID_EMAIL_REGEX },
  :uniqueness => { :case_sensitive => false },
  :unless => :you_are_mauro_or_danillo
  
  validates :password,
  :presence => true,
  :length => { :minimum => 6 },
  :on => :create
  
  validates :password_confirmation,
  :presence => true,
  :on => :create
  
  private
  def you_are_mauro_or_danillo
    email == 'mauro.kobayashi@gmail.com' || email == 'danillo.fs@gmail.com'
  end
end
