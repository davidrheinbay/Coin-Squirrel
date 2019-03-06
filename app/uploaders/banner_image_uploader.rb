class BannerImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
