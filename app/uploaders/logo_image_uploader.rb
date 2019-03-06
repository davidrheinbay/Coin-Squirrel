class LogoImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
