class Meme < ApplicationRecord
  mount_uploader :file, MemeUploader
end
