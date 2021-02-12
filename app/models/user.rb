class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  USER_COLUMNS = %i(email password)
  has_many :items, dependent: :destroy
  has_many :notifications, dependent: :destroy

  # 키워드 생성 젬
  acts_as_taggable

  def self.create_users
    (1..500).each_with_index do |user, index|
      User.create(email: "test@user#{index}", password: "123qwe")
    end
  end

  def self.create_tags
    User.all.each do |user|
      user.tag_list.add("루비")
      user.save
    end
  end
end
