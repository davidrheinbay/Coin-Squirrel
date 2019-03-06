class CurrencyImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
