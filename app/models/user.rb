class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  has_many :events

  has_many :subscriptions
  has_many :events, through: :subscriptions

  def avatar_thubnail
    if avatar.attached?
      avatar.variant(resize_to_limit: [40,40]).processed
    end
  end

  private

  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join('app', 'assets', 'images',  "default_profile.jpg")),
          filename:  "default_profile.jpg",
          content_type: 'image/jpg'
        )
    end
  end
end
