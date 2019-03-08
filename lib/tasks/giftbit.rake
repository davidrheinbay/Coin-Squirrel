namespace :giftbit do
  desc "TODO"
  task loader: :environment do
    GiftbitLoader.new.call
  end
end
