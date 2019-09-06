
require "tty-prompt"
require 'tty-font'
require 'colorize'
require 'terminal-table'
require 'date'
require_relative './display.rb'


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

def add_customer(customers)
    puts "Sorry, you havn't been to our shop before".colorize(:green)
    puts "we need record your information first".colorize(:green) 
    puts "Can I have your name please".colorize(:green) 
    puts "> "
    name=gets.strip()
    puts "Can I have your phone number please".colorize(:green) 
    puts "> "
    phone_number=gets.strip()
    customer_code=rand(0..1000)

    customer={
        name:name,
        phone_number:phone_number.to_s,
        customer_code:customer_code.to_s
    }
    customers << customer

     puts "You have been added to our system, THANKS".colorize(:green)
end

def if_customer(customers, number_input)
    # Returns true if customer
    # Returns false if not customer
    customers.any? do |customer|
        number_input == customer[:phone_number] || number_input == customer[:customer_code]
    end
end



def drop_off(customers, number_input)
    # puts "Welcome,".colorize(:green)
    loop do
        prompt = TTY::Prompt.new
        choice=prompt.select("What kind of service do you need?", %w(Laundry press_only dry_clean Exit))
        
        if choice=="Laundry"
            laundry_service()
        elsif choice=="press_only"
            press_service()
          
        elsif choice == 'dry_clean'
            dry_clean_service()
         
        else
            font = TTY::Font.new(:doom)
            puts font.write("THANKS")
            puts font.write("FOR YOUR  ")
            puts font.write("BUINESS")
            
           
            return
        end 
    end
end

# run(customers)
def run(customers)
    puts "What is your Phone number or customer_code?".colorize(:green)
    puts "> "
    number_input=gets.strip()
    
    if if_customer(customers, number_input)
        drop_off(customers, number_input)
    else
        add_customer(customers)
        drop_off(customers, number_input)
    end
end