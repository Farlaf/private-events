class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  def avatar_thubnail
    # avatar.variant(resize: "150x150!").processed if avatar.attached?
    if avatar.attached?
      avatar.variant(resize_to_limit: [100,100]).processed
    else
      "/default_profile.jpg"
    end
  end
end
