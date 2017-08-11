class User < ApplicationRecord
  devise :database_authenticatable, :recoverable
  include DeviseTokenAuth::Concerns::User
  mount_uploader :picture, PictureUploader

  def as_json except:
    {
      email: self.email,
      description: self.description,
      name: self.name,
      picture: self.picture.url,
      role: self.type
    }
  end
end
