class User < ApplicationRecord
  devise :database_authenticatable, :confirmable, :recoverable
  include DeviseTokenAuth::Concerns::User
  mount_uploader :picture, PictureUploader
end
