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
      name: "Zalando",
      company_entity_name: "Zalando SE",
      commission_perc: 10,
      user_commission_perc: 5,
      referral_link: "#"
    },
    urls: {
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/0/0b/Zalando_logo.svg",
      card_image_url: "https://www.berliner-zeitung.de/image/32119666/2x1/940/470/74f9505ed7fce15a4b7d71e189e8cfc9/Jd/zalando.jpg",
    }
  },
  {
    data: {
      name: "Lieferheld",
      company_entity_name: "Delivery Hero Germany GmbH",
      commission_perc: 10,
      user_commission_perc: 5,
      referral_link: "#"
    },
    urls: {
      logo_image_url: "http://schnitzeria.de/wp-content/themes/Neutrum-Business-Schnitzeria/images/logo-lieferheld.png",
      card_image_url: "https://www.fluxfm.de/wp-content/uploads/2018/02/VALENTINSTAG_66016neu-628x356.jpg",
    }
  },
  {
    data: {
      name: "Asos",
      company_entity_name: "Asos PLC",
      commission_perc: 10,
      user_commission_perc: 5,
      referral_link: "#"
    },
    urls: {
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/a/a8/Asos.svg",
      card_image_url: "https://i0.wp.com/digiday.com/wp-content/uploads/2017/10/170810_ASOS_shot_15_507.jpg",
    }
  },
  {
    data: {
      name: "Expedia",
      company_entity_name: "Expedia Inc",
      commission_perc: 10,
      user_commission_perc: 5,
      referral_link: "#"
    },
    urls: {
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/5/5b/Expedia_2012_logo.svg",
      card_image_url: "https://viewfromthewing.boardingarea.com/wp-content/uploads/2016/02/Expedia-suitcase.jpg",
    }
  },
  {
    data: {
      name: "Home24",
      company_entity_name: "home24 SE",
      commission_perc: 10,
      user_commission_perc: 5,
      referral_link: "#"
    },
    urls: {
      logo_image_url: "https://seeklogo.com/images/H/home24-logo-3F4E4A08A2-seeklogo.com.gif",
      card_image_url: "https://cdn1.home24.net/static/media/om/img/cms/block/L1_moebel/visnav_kueche_bar.jpg",
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
      currency_short: "Vindertech Bucks"
    },
    urls: {
      card_image_url: "https://cdn2.unrealengine.com/Fortnite%2Fbattle-royale%2Fseason6-social-1920x1080-0a72ec2f35dfe5be6cf8a77ec16063cca4db7046.jpg",
      logo_image_url: "https://upload.wikimedia.org/wikipedia/commons/0/0e/FortniteLogo.svg",
      currency_image_url: 'https://pbs.twimg.com/media/DsImRImU0AASOXf.png:large',
      banner_image_url: "http://static.4players.de/premium/Spiele/96/02/29447-teaser1.jpg",
      game_character_image_url: "https://png2.kisspng.com/sh/c3fdb0d772a5243bbaa43f662cd82320/L0KzQYm3V8A2N6N8R91yc4Pzfri0hv9zfJ9ujNc2YnH3hL3sTgJwgZJxfZ9rYYT3fLa0kv96aZ1qRdlqbXWwhrrrhf8ub5IyTdQ8ZHW2coPpWPNnOGUzTqc5NkizRYO4VcMxP2k3TqY7N0W6PsH1h5==/kisspng-fortnite-battle-royale-battle-royale-game-video-ga-5b3de3b2b8cf04.650680521530782642757.png",
      premium_item_image_url: "https://gamepedia.cursecdn.com/fortnite_gamepedia/9/96/Treasure_chest_%28tier_1%29.png",
      shopping_cart_image_url: "https://gamepedia.cursecdn.com/fortnite_gamepedia/0/08/Shopping_cart_icon.png",

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
      balance_currency: "EUR"
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
      balance_currency: "EUR"
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
      balance_cents: 2525,
      balance_currency: "EUR"
    },
    urls: {

    }
  },
  {
    data: {
      first_name: "Max",
      last_name: "Wingber",
      email: "max@coinsquirrel.de",
      password: "Coin2019!",
      game: Game.first,
      balance_cents: 3020,
      balance_currency: "EUR"
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
      balance_currency: "EUR"
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
      currency_target_short: "V-Bucks",
      rate: 100,
      game: Game.first
    },
    urls: {

    }
  },
  {
    data: {
      currency_origin_short: "V-Bucks",
      currency_target_short: "EUR",
      rate: 0.01,
      game: Game.first
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
        transaction_confirmed_date: Date.strptime('03-12-2018', '%d-%m-%Y'),
        transaction_completed_date: Date.strptime('04-12-2018', '%d-%m-%Y'),
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
        transaction_confirmed_date: Date.strptime('02-01-2019', '%d-%m-%Y'),
        transaction_completed_date: Date.strptime('15-01-2019', '%d-%m-%Y'),
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
        transaction_confirmed_date: Date.today,
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
        transaction_confirmed_date: Date.strptime('01-01-2019', '%d-%m-%Y'),
        transaction_completed_date: Date.strptime('01-01-2019', '%d-%m-%Y'),
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
        transaction_confirmed_date: Date.strptime('12-02-2019', '%d-%m-%Y'),
        transaction_completed_date: Date.strptime('15-02-2019', '%d-%m-%Y'),
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
        transaction_confirmed_date: Date.today,
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





























