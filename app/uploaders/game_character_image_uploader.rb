class GameCharacterImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
