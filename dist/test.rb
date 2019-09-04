
require 'tty-font'
require "tty-prompt"
require 'colorize'
require 'terminal-table'
require 'csv'



font = TTY::Font.new(:doom)
puts font.write("WELCOME")
puts font.write("                 H   Y ")
puts font.write("DRY   CLEANING")

prompt = TTY::Prompt.new
puts "Welcome to the DRY CLEANING SERVICE,Please LOG IN NOW....".colorize(:green)

# METHOD LOGIN
def log_in(name,password,users)
    name=prompt.select("Please choose the user name?", %w(Heng  Hannah Upa Hevvon))
    puts "please input your password"
    password=gets.strip()
    counter=0
    while counter<3
        puts "please input your password"
        password=gets.strip()
        users.each do |user|
            if name=user[:name]
                if password==user[:password]
                    puts "You already login"
                    break
                elsif password!=user[:password]
                  
                end
            end

        end
        counter+=1
    end

    puts "Please reset your password"
    
end


def service_view()
    prompt = TTY::Prompt.new
    choice=prompt.select("Choose your destiny?", %w(Laundry press_only dry_clean))
    if choice=="Laundry"
        csv=CSV.read("laundry_price.csv")
        heading=csv.first
        rows=csv[1..-1]
        table1 = Terminal::Table.new :headings => heading, :rows => rows
            puts table1
    elsif choice=="press_only"
        csv=CSV.read("press_only.csv")
        heading=csv.first
        rows=csv[1..-1]
        table2 = Terminal::Table.new :headings => heading, :rows => rows
            puts table2
    else choice=="dry_clean"
        csv=CSV.read("dry_cleaning.csv")
        heading=csv.first
        rows=csv[1..-1]
        table3 = Terminal::Table.new :headings => heading, :rows => rows
            puts table3
    end   
end
service_view()





def option
    prompt = TTY::Prompt.new
    choose=prompt.select("Are you a user or a customer?", %w(user customer))
    if choose=="user"
        log_in()
    elsif choose=="customer"
        prompt = TTY::Prompt.new
        service_choice=prompt.select("Choose your destiny?", %w(Service_view drop_off_garments))   
        if service_choice=="Service_view"
            return service_view()
        elsif service_choice=="drop_off_garments"
            # puts "drop_off_garments"
        end
    
    end 
end
option()
















 