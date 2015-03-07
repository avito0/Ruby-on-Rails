class TwitterProfile < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
end
