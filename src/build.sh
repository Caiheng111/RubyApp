# allows you to execute ./build.sh without the bash keyword
chmod +x ./build.sh
# copy across files to distribution directory
mkdir dist
cp ./app.rb ./dist
cp ./display.rb ./dist
cp ./drop_off_service.rb ./dist
cp ./dry_cleaning.csv ./dist
cp ./laundry_price.csv ./dist
cp ./press_only.csv ./dist
# install all gems
gem install tty-font
gem install tty-prompt 
gem install colorize 
gem install terminal-table 