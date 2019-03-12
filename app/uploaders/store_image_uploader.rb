class StoreImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
