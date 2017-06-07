namespace :reports do
  desc "Write to a file the items"
  # Example: bundle exec rails reports:user_beers
  task items: :environment do
    # open('file path', 'file flag')
    # open a file the desktop
    user = `whoami`.strip
    open("/Users/#{user}/desktop/items.txt", 'w+') do |f|
      # loop through all users in database
      Item.all.each do |item|
      # write lines to that file of user email and beer count
        f << "#{item.name}\n"
      end
    end
    puts 'Items file generated!'
  end
end
