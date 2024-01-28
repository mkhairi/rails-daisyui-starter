# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:login]

  validates :username, presence: true, length: { maximum: 20 }, username: true, uniqueness: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      # when allowing distinct User records with, e.g., "username" and "UserName"...
      where(conditions).where(['username = :value OR lower(email) = :value', { value: login }]).first
    else
      where(conditions).first
    end
  end
end
