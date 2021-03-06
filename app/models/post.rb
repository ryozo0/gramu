class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  belongs_to :user

  mount_uploader :image, ImageUploader

end
