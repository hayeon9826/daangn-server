class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  USER_COLUMNS = %i(email password)
  has_many :items, dependent: :destroy
  has_many :notifications, dependent: :destroy

  acts_as_taggable
end