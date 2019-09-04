
require "tty-prompt"
require 'colorize'
require 'terminal-table'
require 'date'


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


# def add_customer(customers)
#     puts "Sorry, you havn't been to our shop before".colorize(:green)
#     puts "we need record your information first".colorize(:green) 
#     puts "Can I have your name please".colorize(:green) 
#     puts "> "
#     name=gets.strip()
#     puts "Can I have your phone number please".colorize(:green) 
#     puts "> "
#     phone_number=gets.strip()
#     customer_code=rand(0..1000)

#     customer={
#         name:name,
#         phone_number:phone_number.to_s,
#         customer_code:customer_code.to_s
#     }

#      puts "you are already in our system, THANKS".colorize(:green)
#      puts customers
    
# end







# def press_service()
#     item_choose=[]
#     loop do
#         prompt = TTY::Prompt.new
#         item=prompt.select("Choose your item need to press?", %w(COAT/BLAZER SHIRT SUIT/2PC TROUSERS 
#             BLOUSE DRESS KABA2PC KABA/KENTE/2PC KAFTAN/BOUBOU/1PC OVERCOAT POLO/GOLF/SHIRT SHORTS SMOCK/1PC
#             SUIT/3PC) 
       
#         answer = prompt.select('Any other garments need to press?', %w(Yes No))
#         if answer=="No"
#            p item_choose.push(item)
#             return press_display(item_choose)
#         else answer="Yes" 
#             p item_choose.push(item)
#         end  
#     end
      
# end
# press_service()




# # def press_only()
# #     p "dry clean"
# # end


# # def dry_clean()
#     p "dry-clean"
# end


# def drop_off(customers)
#     puts "What is your Phone number or customer_code?"
#     puts "> "
#     number_input=gets.strip()
#     customers.each do |customer|
#         if number_input==customer[:phone_number] ||number_input==customer[:customer_code]
#                 # p "ok " input the customer number code and name
#                 # input the garments
#                 puts "THANKS, you are already our customer"
#                 prompt = TTY::Prompt.new
#                 choice=prompt.select("What kind of service do you need?", %w(Laundry press_only dry_clean))
#                 if choice=="Laundry"
#                     laundry_service()
#                 elsif choice=="press_only"
#                     press_service()
#                 else choice=="dry_clean"
#                     dry_clean()
#                 end
#             end
#         end
#        add_customer(customers)     
# end
# drop_off(customers)