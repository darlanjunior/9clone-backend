class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :validatable
  include DeviseTokenAuth::Concerns::User
  mount_uploader :picture, PictureUploader

  def as_json(except: nil, prefixes: nil, template: nil)
    {
      id: self.id,
      email: self.email,
      description: self.description,
      name: self.name,
      picture: self.picture.url,
      role: self.type
    }
  end
end
