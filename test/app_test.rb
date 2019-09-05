
require 'tty-font'
require "tty-prompt"
require 'colorize'
require 'terminal-table'
require 'csv'
require_relative '../dist/drop_off_service/drop_off_service.rb'
require 'pry'



customers=[
    {name:"Heng",phone_number:"0410780822",customer_code:"123"},
    {name:"zhao",phone_number:"0417827648",customer_code:"234"},
    {name:"hejd",phone_number:"0417833558",customer_code:"544"},
    {name:"zhang",phone_number:"0417867885",customer_code:"56"},
    {name:"Jack",phone_number:"0417359048",customer_code:"46"},
    {name:"kaly",phone_number:"0417826748",customer_code:"56"},
    {name:"molly",phone_number:"0417862748",customer_code:"237"},
    {name:"dee",phone_number:"0417826748",customer_code:"567"},  
]
users=[
    user1={
        name:"Heng",
        password:"admin1234"
    },
    user2={
        name:"Hannah",
        password:"admin719"
    },
    user3={
        name:"Upa",
        password:"admin789"
    },
    user4={
        name:"Hevvon",
        password:"admin467"
    }
]


font = TTY::Font.new(:doom)
puts font.write("WELCOME")
puts font.write("                 H   Y ")
puts font.write("DRY   CLEANING")





def reset_password(users,customers)
        puts "Pleaase enter your user name again".colorize(:green)
        name=gets.strip()
        time=0
        while time < 3
            puts "please enter your new password".colorize(:green)
            puts "> "
            password_one=gets.strip()
            puts "please enter your new password again".colorize(:green)
            puts "> "
            password_two=gets.strip()
            if password_one==password_two
                users.each do |user|
                    if user[:name]==name
                    user[:password]=password_one
                    puts "You already reseted your password.".colorize(:green)
                    service(customers)
                    break

                    end
               end  
            end
        time+=1
        end
end

def check_password(users,name)
    puts "please input your password".colorize(:green)
    password=gets.strip()
    found_user = users.find do |user|
        user[:name] == name
    end

    if found_user[:password] == password
        return found_user
    else
        puts "wrong password"
       
    end

end




def service_view()

    prompt = TTY::Prompt.new
    choice=prompt.select("What cleaning service do you need?", %w(Laundry Press_only Dry_clean))
    if choice=="Laundry"
        csv=CSV.read("laundry_price.csv")
        heading=csv.first
        rows=csv[1..-1]
        table1 = Terminal::Table.new :headings => heading, :rows => rows
            puts table1
    elsif choice=="Press_only"
        csv=CSV.read("press_only.csv")
        heading=csv.first
        rows=csv[1..-1]
        table2 = Terminal::Table.new :headings => heading, :rows => rows
            puts table2
    else choice=="Dry_clean"
        csv=CSV.read("dry_cleaning.csv")
        heading=csv.first
        rows=csv[1..-1]
        table3 = Terminal::Table.new :headings => heading, :rows => rows
            puts table3
    end 
end


def service(customers)
    loop do
        prompt = TTY::Prompt.new
        service_choice=prompt.select("Please choose your service?", %w(Service_view Drop_off_garments))   
        if service_choice=="Service_view"
             service_view()
        elsif service_choice=="Drop_off_garments"
            run(customers)
        else
            break
            
        end
    end
end



def log_in(users,customers)
    prompt = TTY::Prompt.new
    name = prompt.select("Please choose the staff name?", %w(Heng  Hannah Upa Hevvon))
    counter=0
  while counter<3
    if check_password(users,name)
        puts "THANKS,#{nmae},You already login."
        # puts "THANKS,#{user[:name]},You already logined." .colorize(:green)
        # puts "----------------------------------".colorize(:green)
        service(customers)
        break
    else
        
    end
        counter+=1
    end
    puts "SORRY, you already enter three times, please reset your password.".colorize(:green)
    reset_password(customers,users)

end





def option(users,customers)
    
    prompt = TTY::Prompt.new
    choose=prompt.select("Are you a staff or a customer?", %w(Staff Customer Exit))
    if choose=="Staff"
        log_in(users,customers)
    elsif choose=="Customer"
        service(customers)
    end 
end
option(users,customers)























