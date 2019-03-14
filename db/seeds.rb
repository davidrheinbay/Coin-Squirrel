require 'date'

# destroying everything

puts "starting to destroy"

puts " destroying all the exchange rates"

ExchangeRate.destroy_all

puts " destroying all the games"

Game.destroy_all

puts " destroying all the partners"

Partner.destroy_all

puts " destroying all the users"

User.destroy_all

puts "finished destroying / starting to seed"

# seeding new partners, delivery_hero, zalando, asos, xpedia, home24

puts " starting to seed partners"

partners = [
  {
    data: {
      name: "CoinSquirrel",
      company_entity_name: "CoinSquirrel GmbH",
      commission_perc: 10,
      user_commission_perc: 5,
      referral_link: "#",
      awin_advertiser_id: "8022"
    },
    urls: {
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/0/0b/Zalando_logo.svg",
      card_image_url: "https://www.berliner-zeitung.de/image/32119666/2x1/940/470/74f9505ed7fce15a4b7d71e189e8cfc9/Jd/zalando.jpg",
    }
  },
  {
    data: {
      name: "Avira",
      company_entity_name: "Avira GmbH & Co. KG",
      commission_perc: 25,
      user_commission_perc: 15,
      referral_link: "http://www.awin1.com/awclick.php?mid=7626&id=575543",
      tags: ['antivirus', 'security', 'software', 'virus', 'protection'],
      awin_advertiser_id: "7626"
    },
    urls: {
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Avira_logo_2011.png/800px-Avira_logo_2011.png",
      card_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552389716/avira.001.jpg",
    }
  },
  {
    data: {
      name: "CarDelMar",
      company_entity_name: "Ferienautovermietung GmbH",
      commission_perc: 8,
      user_commission_perc: 8,
      referral_link: "http://www.awin1.com/awclick.php?mid=9120&id=575543",
      tags: ['rental', 'auto', 'vermietung', 'mieten', 'Mietwagen'],
      awin_advertiser_id: "9120"
    },
    urls: {
      logo_image_url: "https://cr-cms-prod.s3.amazonaws.com/production/cms/assets/cdm-logo-66ddfafc42b7bfb7c26c452eeecbce66d3c92acd053312d81e792109c1ba2dba.jpg",
      card_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552389667/cardelmar.jpg",
    }
  },
  {
    data: {
      name: "Casando",
      company_entity_name: "Holz-Richter GmbH",
      commission_perc: 4,
      user_commission_perc: 2,
      referral_link: "http://www.awin1.com/awclick.php?mid=10992&id=575543",
      tags: ['furniture', 'möbel', 'haus', 'deko', 'baumarkt', 'sauna', 'terrasse'],
      awin_advertiser_id: "10992"
    },
    urls: {
      logo_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552400114/Screenshot_2019-03-12_at_15.13.57.png",
      card_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552389776/casando.001.jpg",
    }
  },
  {
    data: {
      name: "Yello Strom",
      company_entity_name: "Yello Strom GmbH",
      commission_perc: 15,
      user_commission_perc: 10,
      referral_link: "http://www.awin1.com/awclick.php?mid=11433&id=575543",
      tags: ['gas', 'strom', 'heizung', 'heating', 'electricity', 'yellow'],
      awin_advertiser_id: "11433"
    },
    urls: {
      logo_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552401372/yello-Logo-gelb.png",
      card_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552389622/yello.001.jpg",
    }
  },
  {
    data: {
      name: "AutoDoc",
      company_entity_name: "Autodoc GmbH",
      commission_perc: 6,
      user_commission_perc: 2,
      referral_link: "http://ui.zanox.com/bin/z_in_frm.dll?4008400940080&128025573C765357919&981552299232_151291257_2718917",
      tags:['car', 'parts', 'Autoteile', 'Reparatur', 'repair']
    },
    urls: {
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/2/23/Autodoc.png",
      card_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552389732/autodoc.001.jpg"
    }
  },

  # Fake Partner ---------------------------------------------------------------
  {
    data: {
      name: "Deliveroo",
      company_entity_name: "Deliveroo Limited",
      commission_perc: 4,
      user_commission_perc: 2,
      referral_link: "https://deliveroo.de",
      tags:['food', 'delivery']
    },
    urls: {
      logo_image_url: "https://cdn2.downdetector.com/static/uploads/logo/deliveroo.png",
      card_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552389749/deliveroo.001.jpg"
    }
  },

  {
    data: {
      name: "Easyjet",
      company_entity_name: "easyJet Airline Company PLC",
      commission_perc: 10,
      user_commission_perc: 3,
      referral_link: "https://www.easyjet.com/de",
      tags:['travel', 'flight']
    },
    urls: {
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/EasyJet_logo.svg/2000px-EasyJet_logo.svg.png",
      card_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552389764/easyjet.001.jpg"
    }
  },

  {
    data: {
      name: "Steam",
      company_entity_name: "Valve Corporation",
      commission_perc: 5,
      user_commission_perc: 3,
      referral_link: "https://store.steampowered.com/?l=german",
      tags:['game', 'online']
    },
    urls: {
      logo_image_url: "http://old.pcgamer.no/wp-content/uploads/2018/12/steam-logo.png",
      card_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552389698/steam.001.jpg"
    }
  }


]


partners.each do |partner|
  partnerDB = Partner.new(partner[:data])
  partnerDB.remote_logo_image_url = partner[:urls][:logo_image_url]
  partnerDB.remote_card_image_url = partner[:urls][:card_image_url]
  partnerDB.save!
end

puts " finished seeding partners"

# seeding games, fortnite

puts " starting to seed games"

games = [
  {
    data: {
      name: "Fortnite",
      currency_name: "V-Bucks",
      currency_short: "VB",
      description: "Get the newest skins, gliders and emotes."
    },
    urls: {
      card_image_url: "https://cdn2.unrealengine.com/Fortnite%2Fbattle-royale%2Fseason6-social-1920x1080-0a72ec2f35dfe5be6cf8a77ec16063cca4db7046.jpg",
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/0/0e/FortniteLogo.svg",
      currency_image_url: 'https://pbs.twimg.com/media/DsImRImU0AASOXf.png:large',
      banner_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552582980/uqm5b1mc21ppvch6crq8.jpg",
      game_character_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552059687/gemjcanrjsjlk3mvrg7y.png",
      premium_item_image_url: "https://gamepedia.cursecdn.com/fortnite_gamepedia/9/96/Treasure_chest_%28tier_1%29.png",
      shopping_cart_image_url: "https://gamepedia.cursecdn.com/fortnite_gamepedia/0/08/Shopping_cart_icon.png",
      store_image: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552322437/fortnite-store-header.jpg"
    }
  },
  {
    data: {
      name: "Pubg",
      currency_name: "G-Coin",
      currency_short: "GC",
      description: "Get the latest skins, outfits and crates."
    },
    urls: {
      card_image_url: "https://wallpapercave.com/wp/wp3276765.jpg",
      logo_image_url: "https://banner2.kisspng.com/20180707/sil/kisspng-playerunknown-s-battlegrounds-t-shirt-pubg-corpora-pubg-logo-5b415e8fa2db29.0381114715310107036671.jpg",
      currency_image_url: 'https://res.cloudinary.com/dmr1qubzk/image/upload/v1552054927/769.png',
      banner_image_url: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552574878/xxgeyra4gumgv2qatshb.jpg",
      game_character_image_url: "https://pngimg.com/uploads/pubg/pubg_PNG22.png",
      premium_item_image_url: "https://gamepedia.cursecdn.com/battlegrounds_gamepedia_en/6/65/Icon_box_preOrder.png",
      shopping_cart_image_url: "https://gamepedia.cursecdn.com/fortnite_gamepedia/0/08/Shopping_cart_icon.png",
      store_image: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552322630/pubg-store-header.jpg"
    }
  },
  {
    data: {
      name: 'Dota',
      currency_name: 'D-Coins',
      currency_short: 'DC',
      description: "Get the newest armaments, cloaks and weapons."
    },
    urls: {
      card_image_url: 'https://es.me/wp-content/uploads/2019/01/Dota-2-esports-empire-play.jpg',
      logo_image_url: 'https://steamuserimages-a.akamaihd.net/ugc/577865573024972042/BE1429F2D32F1ECB9123A3AA9D9FE2AC61BC4F3E/',
      currency_image_url: 'https://res.cloudinary.com/dmr1qubzk/image/upload/v1552305072/dota2.png',
      banner_image_url: 'https://res.cloudinary.com/dmr1qubzk/image/upload/v1552462886/dota_banner_big_cropped.jpg',
      game_character_image_url: 'https://gamepedia.cursecdn.com/dota2_gamepedia/thumb/3/31/Dota_Heroes.png/300px-Dota_Heroes.png?version=fe57923c5e34e392f524a291e1b94e41',
      premium_item_image_url: 'https://res.cloudinary.com/dmr1qubzk/image/upload/v1552402212/qnjfi9hp0pm2zmtpgtzf.png',
      shopping_cart_image_url: 'https://gamepedia.cursecdn.com/fortnite_gamepedia/0/08/Shopping_cart_icon.png',
      store_image: "https://res.cloudinary.com/dmr1qubzk/image/upload/v1552322816/dota-store-header.jpg"
    }
  }
]


games.each do |game|
  gameDB = Game.new(game[:data])
  gameDB.remote_card_image_url = game[:urls][:card_image_url]
  gameDB.remote_logo_image_url = game[:urls][:logo_image_url]
  gameDB.remote_currency_image_url = game[:urls][:currency_image_url]
  gameDB.remote_banner_image_url = game[:urls][:banner_image_url]
  gameDB.remote_game_character_image_url = game[:urls][:game_character_image_url]
  gameDB.remote_premium_item_image_url = game[:urls][:premium_item_image_url]
  gameDB.remote_shopping_cart_image_url = game[:urls][:shopping_cart_image_url]
  gameDB.remote_store_image_url = game[:urls][:store_image]
  gameDB.save!
end

puts " finished seeding games"

# seeding users

puts " starting to seed users"

users = [
  {
    data: {
      first_name: "Coin",
      last_name: "Squirrels",
      email: "devs@coinsquirrel.de",
      password: "Coin2019!",
      game: Game.first,
      balance_cents: 99999,
      balance_currency: "EUR",
      admin: true
    },
    urls: {

    }
  },
  {
    data: {
      first_name: "Konrad",
      last_name: "Baumann",
      email: "konrad@coinsquirrel.de",
      password: "Coin2019!",
      game: Game.first,
      balance_cents: 8080,
      balance_currency: "EUR",
      admin: false
    },
    urls: {

    }
  },
  {
    data: {
      first_name: "David",
      last_name: "Rheinbay",
      email: "david@coinsquirrel.de",
      password: "Coin2019!",
      game: Game.first,
      balance_cents: 800,
      balance_currency: "EUR",
      admin: false
    },
    urls: {
      profile_image_url: 'https://www.shareicon.net/data/128x128/2016/08/05/807310_gaming_512x512.png'
    }
  },
  {
    data: {
      first_name: "Max",
      last_name: "Wingber",
      email: "max@coinsquirrel.de",
      password: "Coin2019!",
      game: Game.first,
      balance_cents: 10000,
      balance_currency: "EUR",
      admin: false

    },
    urls: {
      profile_image_url: 'http://fanaru.com/my-neighbor-totoro/image/185574-my-neighbor-totoro-totoro.png'
    }
  },
  {
    data: {
      first_name: "Hans",
      last_name: "Schwarz",
      email: "hans@coinsquirrel.de",
      password: "Coin2019!",
      game: Game.first,
      balance_cents: 10001,
      balance_currency: "EUR",
      admin: false
    },
    urls: {
      profile_image_url: "https://www.expressandstar.com/resizer/kUXSB6x7igtCObjUqp2hrDUUjAk=/1000x0/filters:quality(100)/arc-anglerfish-arc2-prod-expressandstar-mna.s3.amazonaws.com/public/Q36HAOGOV5F4JDBMGP6UPS5HAQ.jpg"
    }
  }
]


users.each do |user|
  userDB = User.new(user[:data])
  if user[:urls][:profile_image_url].present?
    userDB.remote_profile_image_url = user[:urls][:profile_image_url]
  end
  userDB.save!
end

puts " finished seeding users"

# seeding exchange rates

puts " starting to seed exchange rates"

exchange_rates = [
  {
    data: {
      currency_origin_short: "EUR",
      currency_target_short: "VB",
      rate: 90,
      game: Game.first
    },
    urls: {

    }
  },
  {
    data: {
      currency_origin_short: "VB",
      currency_target_short: "EUR",
      rate: 0.0111,
      game: Game.first
    },
    urls: {

    }
  },
  {
    data: {
      currency_origin_short: "EUR",
      currency_target_short: "GC",
      rate: 50,
      game: Game.second
    },
    urls: {

    }
  },
  {
    data: {
      currency_origin_short: "GC",
      currency_target_short: "EUR",
      rate: 0.5,
      game: Game.second
    },
    urls: {

    }
  },
  {
    data: {
      currency_origin_short: "EUR",
      currency_target_short: "DC",
      rate: 120,
      game: Game.third
    },
    urls: {

    }
  },
  {
    data: {
      currency_origin_short: "DC",
      currency_target_short: "EUR",
      rate: 83.3333,
      game: Game.third
    },
    urls: {

    }
  }
]


exchange_rates.each do |exchange_rate|
  exchange_rateDB = ExchangeRate.new(exchange_rate[:data])
  exchange_rateDB.save!
end

puts " finished seeding exchange rates"

# seeding transactions

puts " starting to seed transactions"
puts "   for User:"

User.all.each do |user|
  transactions = [
    {
      data: {
        user: user,
        transaction_type: "cash_out",
        game: Game.first,
        gmv_eur_cents: 0,
        commission_perc: 0,
        user_commission_share_perc: 0,
        user_commission_amount_cents: 150,
        eur_currency_rate: 100,
        transaction_confirmed_date: DateTime.strptime('03-12-2018T17:05:06+01:00', '%d-%m-%YT%H:%M:%S%z'),
        transaction_completed_date: DateTime.strptime('04-12-2018T14:09:06+01:00', '%d-%m-%YT%H:%M:%S%z'),
        state: "completed",
        link_used: "#"
      }
    },
    {
      data: {
        user: user,
        transaction_type: "cash_out",
        game: Game.first,
        gmv_eur_cents: 0,
        commission_perc: 0,
        user_commission_share_perc: 0,
        user_commission_amount_cents: 200,
        eur_currency_rate: 100,
        transaction_confirmed_date: DateTime.strptime('02-01-2019T12:35:07+01:00', '%d-%m-%YT%H:%M:%S%z'),
        transaction_completed_date: DateTime.strptime('15-01-2019T14:26:06+01:00', '%d-%m-%YT%H:%M:%S%z'),
        state: "completed",
        link_used: "#"
      }
    },
    {
      data: {
        user: user,
        transaction_type: "cash_out",
        game: Game.first,
        gmv_eur_cents: 0,
        commission_perc: 0,
        user_commission_share_perc: 0,
        user_commission_amount_cents: 500,
        eur_currency_rate: 100,
        transaction_confirmed_date: DateTime.now,
        transaction_completed_date: nil,
        state: "confirmed",
        link_used: "#"
      }
    },
    {
      data: {
        user: user,
        transaction_type: "cash_in",
        game: Game.first,
        gmv_eur_cents: 20000,
        commission_perc: 10,
        user_commission_share_perc: 5,
        user_commission_amount_cents: 1000,
        eur_currency_rate: 100,
        transaction_confirmed_date: DateTime.strptime('01-01-2019T10:23:06+01:00', '%d-%m-%YT%H:%M:%S%z'),
        transaction_completed_date: DateTime.strptime('01-01-2019T11:48:06+01:00', '%d-%m-%YT%H:%M:%S%z'),
        state: "completed",
        link_used: "#",
        partner: Partner.first
      }
    },
    {
      data: {
        user: user,
        transaction_type: "cash_in",
        game: Game.first,
        gmv_eur_cents: 4000,
        commission_perc: 10,
        user_commission_share_perc: 5,
        user_commission_amount_cents: 200,
        eur_currency_rate: 100,
        transaction_confirmed_date: DateTime.strptime('12-02-2019T18:09:06+01:00', '%d-%m-%YT%H:%M:%S%z'),
        transaction_completed_date: DateTime.strptime('15-02-2019T22:07:06+01:00', '%d-%m-%YT%H:%M:%S%z'),
        state: "completed",
        link_used: "#",
        partner: Partner.second
      }
    },
    {
      data: {
        user: user,
        transaction_type: "cash_in",
        game: Game.first,
        gmv_eur_cents: 3000,
        commission_perc: 10,
        user_commission_share_perc: 5,
        user_commission_amount_cents: 150,
        eur_currency_rate: 100,
        transaction_confirmed_date: DateTime.now,
        transaction_completed_date: nil,
        state: "confirmed",
        link_used: "#",
        partner: Partner.third
      }
    },
  ]


  transactions.each do |transaction|
    transactionDB = Transaction.new(transaction[:data])
    transactionDB.save!
  end

  puts "     #{user.email}"

end

puts " finished seeding transactions"

puts "finished seeding"





























