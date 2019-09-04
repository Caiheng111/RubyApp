require "tty-prompt"
require 'colorize'
require 'terminal-table'
require 'date'


def laundry_display(item_choose)
    total_price=0
    if item_choose.length==1
        File.open('laundry_price.csv',"r").each_with_index do |item,index|
            if item.include?(item_choose[0])
                price=item.split(',')[3]
                total_price=price
                drop_off_date=Date.today()
                ticket_number=rand(0..10000)

                prompt = TTY::Prompt.new
                pickup_date=prompt.select("When would like to pich up your garments?", %w(tomorrow one_day_later two_days_days))
                puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)
    
                if pickup_date=="tomorrow"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)"]
                        t.add_row [ticket_number,item_choose[0],"Laundry",price,drop_off_date,drop_off_date+1,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                elsif pickup_date=="one_day_later"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)",]
                        t.add_row [ticket_number,item_choose[0],"Laundry",price,drop_off_date,drop_off_date+2,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                else pickup_date=="two_days_days"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)"]
                        t.add_row [ticket_number,item_choose[0],"Laundry",price,drop_off_date,drop_off_date+3,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                end

            end  
            end 
    
    else item_choose.length > 1
        rows=[]
        total_price=0
        File.open('laundry_price.csv',"r").each do |item1|
            item_choose.each do |item2|
                if item1.include?(item2)
                price=item1.split(',')[3].to_i
                drop_off_date=Date.today()
                item_array=[item2,"Laundry",price,drop_off_date]
                rows=rows.push(item_array)
                total_price+=price 
                end  
                
            end
        end 
        prompt = TTY::Prompt.new
        pickup_date=prompt.select("When would like to pich up your garments?", %w(tomorrow one_day_later two_days_days))
        ticket_number=rand(0..10000)
        drop_off_date=Date.today()
        if pickup_date=="tomorrow"
            puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)

            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+1}.".colorize(:green)
        elsif pickup_date=="one_day_later"
            puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)

            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+2}.".colorize(:green)
        else pickup_date=="two_days_days"
            puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)
    
            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+3}.".colorize(:green)
        end
       
    end
            
end





def press_display(item_choose)
    total_price=0
    if item_choose.length==1
        File.open('press_only.csv',"r").each_with_index do |item,index|
            if item.include?(item_choose[0])
                price=item.split(',')[3]
                total_price=price
                drop_off_date=Date.today()
                ticket_number=rand(0..10000)

                prompt = TTY::Prompt.new
                pickup_date=prompt.select("When would like to pich up your garments?", %w(tomorrow one_day_later two_days_days))
                puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)
    
                if pickup_date=="tomorrow"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)"]
                        t.add_row [ticket_number,item_choose[0],"Press",price,drop_off_date,drop_off_date+1,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                elsif pickup_date=="one_day_later"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)",]
                        t.add_row [ticket_number,item_choose[0],"Press",price,drop_off_date,drop_off_date+2,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                else pickup_date=="two_days_days"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)"]
                        t.add_row [ticket_number,item_choose[0],"Press",price,drop_off_date,drop_off_date+3,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                end

            end  
            end 
    
    else item_choose.length > 1
        rows=[]
        total_price=0
        File.open('press_only.csv',"r").each do |item1|
            item_choose.each do |item2|
                if item1.include?(item2)
                price=item1.split(',')[3].to_i
                drop_off_date=Date.today()
                item_array=[item2,"Press",price,drop_off_date]
                rows=rows.push(item_array)
                total_price+=price 
                end  
                
            end
        end 
        prompt = TTY::Prompt.new
        pickup_date=prompt.select("When would like to pich up your garments?", %w(tomorrow one_day_later two_days_days))
        ticket_number=rand(0..10000)
        drop_off_date=Date.today()
        if pickup_date=="tomorrow"
            puts "Thanks, this is your ticket,please keep the ticket to pich up your garments.".colorize(:green)
            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+1}.".colorize(:green)
        elsif pickup_date=="one_day_later"
            
            puts "Tanks, this is your ticket,please keep the ticket to pich up your garments.".colorize(:green)
            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+2}.".colorize(:green)
        else pickup_date=="two_days_days"
            puts "Tanks, this is your ticket,please keep the ticket to pich up your garments.".colorize(:green)
            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+3}.".colorize(:green)
        end
       
    end
            
end







def dry_clean_display(item_choose)
    total_price=0
    if item_choose.length==1
        File.open('dry_cleaning.csv',"r").each_with_index do |item,index|
            if item.include?(item_choose[0])
                price=item.split(',')[3]
                total_price=price
                drop_off_date=Date.today()
                ticket_number=rand(0..10000)
                prompt = TTY::Prompt.new
                pickup_date=prompt.select("When would like to pich up your garments?", %w(tomorrow one_day_later two_days_days))
                puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)
                if pickup_date=="tomorrow"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)"]
                        t.add_row [ticket_number,item_choose[0],"Dry Clean",price,drop_off_date,drop_off_date+1,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                elsif pickup_date=="one_day_later"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)",]
                        t.add_row [ticket_number,item_choose[0],"Dry Clean",price,drop_off_date,drop_off_date+2,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                else pickup_date=="two_days_days"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Service","Price","Drop_Off Date","Delieved Date","Total($)"]
                        t.add_row [ticket_number,item_choose[0],"Dry Clean",price,drop_off_date,drop_off_date+3,total_price]
                        t.style = {:all_separators => true}
                    end
                    puts table
                end

            end  
            end 
    
    else item_choose.length > 1
        rows=[]
        total_price=0
        File.open('dry_cleaning.csv',"r").each do |item1|
            item_choose.each do |item2|
                if item1.include?(item2)
                price=item1.split(',')[3].to_i
                drop_off_date=Date.today()
                item_array=[item2,"Dry Clean",price,drop_off_date]
                rows=rows.push(item_array)
                total_price+=price 
                end  
                
            end
        end 
        prompt = TTY::Prompt.new
        pickup_date=prompt.select("When would like to pich up your garments?", %w(tomorrow one_day_later two_days_days))
        ticket_number=rand(0..10000)
        drop_off_date=Date.today()
        if pickup_date=="tomorrow"
            puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)
            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+1}.".colorize(:green)
        elsif pickup_date=="one_day_later"
            puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)
            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+2}.".colorize(:green)
        else pickup_date=="two_days_days"
            puts "Thanks, this is your ticket,please keep the ticket to pich up your garments".colorize(:green)
            puts "The ticket number is #{ticket_number}.".colorize(:green)
            table = Terminal::Table.new :headings => ["Item","Service","Price","Drop_Off Date"], :rows => rows
            puts table
            puts "The total price is $#{total_price}.".colorize(:green)
            puts "You can pick up the garments at #{drop_off_date+3}.".colorize(:green)
        end
       
    end
            
end





def laundry_service()
    item_choose=[]
    loop do
        prompt = TTY::Prompt.new
        item=prompt.select("Choose your item need to laundry?", %w(SHIRTS/SHORT SHIRTS/LONG PANTS/NO/STARCH PANTS/MED 
            SHORTS/NO/STARCH SHORTS/MED/STARCH LAB/COAT/LIGHT/STARCH JACKET/LIGHT SKIRTS DRESSES DRESSES/HEAVY/STARCH CAMMIES/HEAVY/TARCH DRAPES
            PILLOW/CASES)) 
       
        answer = prompt.select('Any other garments need to laundry?', %w(Yes No))
        if answer=="No"
            item_choose.push(item)
            puts "Please wait a min, we are printing your ticket,THANKS".colorize(:green)
            puts "..............".colorize(:green)
            puts "...........".colorize(:green)
            puts "......".colorize(:green)
            return laundry_display(item_choose)
        else answer="Yes" 
             item_choose.push(item)
        end  
    end
    
end
laundry_service()





def press_service()
    item_choose=[]
    loop do
        prompt = TTY::Prompt.new
        item=prompt.select("Choose your item need to laundry?", %w(COAT/BLAZER SHIRT SUIT/2PC TROUSERS
            BLOUSE DRESS KABA2PC OVERCOAT POLO/GOLF/SHIRT ROBE/ACADEMIC/CHOIR SHORTS SUIT/3PC T-SHIRT
            PILLOW/CASES)) 
       
        answer = prompt.select('Any other garments need to press?', %w(Yes No))
        if answer=="No"
            item_choose.push(item)
            puts "Please wait a min, we are printing your ticket,THANKS".colorize(:green)
            puts "..............".colorize(:green)
            puts "...........".colorize(:green)
            puts "......".colorize(:green)
            return press_display(item_choose)
        else answer="Yes" 
             item_choose.push(item)
        end  
    end
    
end
press_service()




def dry_clean_service()
    item_choose=[]
    loop do
        prompt = TTY::Prompt.new
        item=prompt.select("Choose your item need to laundry?", %w(2PC/SUIT BLOUSE DRESS GOWNS
            PANTS SHORTS SHIRTS SKIRTS SWEATERS TIE/CUMMERBUND SHAWL/SCARFS VEST
            PILLOW/CASES)) 
       
        answer = prompt.select('Any other garments need to press?', %w(Yes No))
        if answer=="No"
            item_choose.push(item)
            puts "Please wait a min, we are printing your ticket,THANKS".colorize(:green)
            puts "..............".colorize(:green)
            puts "...........".colorize(:green)
            puts "......".colorize(:green)
            return dry_clean_display(item_choose)
        else answer="Yes" 
             item_choose.push(item)
        end  
    end
    
end
dry_clean_service()