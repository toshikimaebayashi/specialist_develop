class User < ApplicationRecord
  mount_uploader :iconimageurl, UserUploader
  mount_uploader :coverimageurl, UserUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
