
require 'tty-font'
require "tty-prompt"
require 'colorize'
require 'terminal-table'
require 'csv'



font = TTY::Font.new(:doom)
puts font.write("welcome")
puts font.write("                 H   Y ")
puts font.write("dry clean")

prompt = TTY::Prompt.new
puts "Welcome to the DRY CLEANING SERVICE,Please LOG IN NOW....".colorize(:green)


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
    choices = %w(Laundry dry_clean Press_only)
    prompt.multi_select("Select service?", choices)
 
  
    csv=CSV.read("laundry_price.csv")
    heading=csv.first
    rows=csv[1..-1]
    table = Terminal::Table.new :headings => heading, :rows => rows
        puts table

end


def option
    prompt = TTY::Prompt.new
    choose=prompt.select("Are you a user or a customer?", %w(user customer))
    if choose=="user"
        log_in()
    elsif choose=="customer"
        prompt = TTY::Prompt.new
        service_view = %w(Service_view drop_off_garments)
        prompt.multi_select("Select service", service_view)
            
        if service_view=="Service_view"
            return service_view()
        elsif service_view=="drop_off_garments"
            # puts "drop_off_garments"
        end
    
    end 
end
option()
















 