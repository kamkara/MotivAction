class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   ################## VALIDATES  ###############
  validates :username, :email, :contact, :role,  presence: true
  validates :username, length: { minimum:5 }

  ################## SLUG ###############
  extend FriendlyId
    friendly_id :username, use: :slugged

  def should_generate_new_friendly_id?
    username_changed?
  end

  ################  SIGN IN PHONE NUMBR OR EMAIL  ###########################

def login
  @login || self.username || self.email
end

def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions.to_h).where(["lower(phone_contact) = :value OR lower(email) = :value", { :value => login }]).first
  elsif conditions.has_key?(:username) || conditions.has_key?(:email)
    where(conditions.to_h).first
  end
end
end
