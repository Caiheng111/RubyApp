
require 'tty-font'
require "tty-prompt"
require 'colorize'
require 'terminal-table'
require 'csv'
require_relative '../dist/drop_off_service/drop_off_service.rb'



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

users=[
    user1={
        name:"Heng",
        password:"admin123"
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



def reset_password()
        puts "Pleaase input your username again"
        name=gets.strip()
        time=0
        while time < 3
            puts "please enter your new password"
            puts "> "
            password_one=gets.strip()
            puts "please enter your new password again"
            puts "> "
            password_two=gets.strip()
            if password_one==password_two
                users.each do |user|
                    if user[:nmae]==name
                    users[:password]=password_one
                    puts "You already reseted your password," 
                    break
                    elsif
                    password_one != password_two  
               end  
            end
        time+=1
        end
    end
end



def log_in(users)

    prompt = TTY::Prompt.new
    name=prompt.select("Please choose the staff name?", %w(Heng  Hannah Upa Hevvon))
    puts "please input your password"
    password=gets.strip()

        users.each do |user|
            if name=user[:name] && password==user[:password]
           
                puts "THANKS,#{name},You already logined." 
                break
            else
                reset_password()
               
            end

        end

end

def service_view()

    prompt = TTY::Prompt.new
    choice=prompt.select("What cleaning service do you need?", %w(Laundry press_only dry_clean))
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



def option(users,customers)
    
    prompt = TTY::Prompt.new
    choose=prompt.select("Are you a staff or a customer?", %w(Staff Customer Exit))
    if choose=="Staff"
        log_in(users)
        service_view()
        

    elsif choose=="Customer"
    loop do
        prompt = TTY::Prompt.new
        service_choice=prompt.select("Please choose your service?", %w(Service_view drop_off_garments))   
        if service_choice=="Service_view"
             service_view()
        elsif service_choice=="drop_off_garments"
            run(customers)
        else
            break
            
        end
    end
    end 
end
option(users,customers)























