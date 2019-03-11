namespace :scheduler do
  desc "Updates Awin Programme Infos"
  task updateawinprogrammes: :environment do
    puts "-> Getting programme info..."
    AwinGetJoinedProgrammes.new.call
    puts "-> All programmes updated!"
  end

  desc "Get Awin Transactions"
  task updateawintransaction: :environment do
    puts "-> Getting transactions..."
    AwinGetJoinedProgrammes.new.call
    puts "-> All transactions updated!"
  end
end
