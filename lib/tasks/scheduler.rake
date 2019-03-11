namespace :scheduler do
  desc "Updates Awin Programme Infos"
  task updateawin: :environment do
    puts "-> Getting programme info..."
    AwinGetJoinedProgrammes.new.call
    puts "-> All programmes updated!"
  end
end
