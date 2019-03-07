namespace :giftbit do
  desc "TODO"
  task loader: :environment do
    GiftbitLoader.new.post
  end

end
