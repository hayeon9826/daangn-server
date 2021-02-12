class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  # 이미지를 가진 게시글 삭제 시 AWS S3서버에도 자동 삭제처리
  before_destroy :destroy_assets

  belongs_to :user, optional: true
  has_many :notifications, dependent: :destroy
  # item 생성 후, 키워드 알림글 생성
  after_create :create_notification

  def create_notification
    tag_list = self.title.split(" ")
    User.tagged_with(tag_list, any: true).each do |user|
      if user != self.user
        user.notifications.create(title: "[#{(tag_list & user&.tag_list).join(", ")} 키워드 알림] #{self&.location} - #{self&.title}", user: user, item: self)
      end
    end
  end

  def destroy_assets
    self.image.remove! if self.image
    self.save!
  end

end
