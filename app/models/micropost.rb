class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  scope :create_desc, ->{order created_at: :desc}
  scope :microposts_by_user, ->id{where user_id: id}
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.max_content}
  validate :picture_size

  private

  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add :picture, I18n.t("error_pic")
  end
end
