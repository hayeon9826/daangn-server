class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true

  after_create :create_notification

  def create_notification
    tag_list = self.title.split(" ")
    User.tagged_with(tag_list, any: true).each do |user|
      if user != self.user
        user.notifications.create(title: "[#{(tag_list & user&.tag_list).join(", ")} 키워드 알림] #{self&.title} - #{self&.location}", user: user, item: self)
      end
    end
  end

end
