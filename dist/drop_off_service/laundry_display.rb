require "tty-prompt"
require 'colorize'
require 'terminal-table'
require 'date'

def laundry_display(item_choose)
    total_price=0
    if item_choose.length==1
        File.open('laundry_price.csv',"r").each_with_index do |item,index|
            if item.include?(item_choose[0])
                puts "true"
                price=item.split(',')[3]
                total_price=price
                drop_off_date=Date.today()
                ticket_number=rand(0..10000)

                prompt = TTY::Prompt.new
                pickup_date=prompt.select("When would like to pich up your garments?", %w(tomorrow one_day_later two_days_days))
                puts "Tanks, this is your ticket,please keep the ticket to pich up your garments "
                if pickup_date=="tomorrow"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Price","Total","Drop_Off Date","Delieved Date"]
                        t.add_row [ticket_number,item_choose[0],price,total_price,drop_off_date,drop_off_date+1]
                        t.style = {:all_separators => true}
                    end
                    puts table
                elsif pickup_date=="one_day_later"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Price","Total","Drop_Off Date","Delieved Date"]
                        t.add_row [ticket_number,item_choose[0],price,total_price,drop_off_date,drop_off_date+2]
                        t.style = {:all_separators => true}
                    end
                    puts table
                else pickup_date=="two_days_days"
                    table = Terminal::Table.new do |t|
                        t.add_row ["Ticket_number","Item","Price","Total","Drop_Off Date","Delieved Date"]
                        t.add_row [ticket_number,item_choose[0],price,total_price,drop_off_date,drop_off_date+3]
                        t.style = {:all_separators => true}
                    end
                    puts table
                end

            end  
            end 
    
    else item_choose.length > 0
        File.open('laundry_price.csv',"r").each do |item1|
            item_choose.each_with_index do |item2,index|
                
                if item1.include?(item2)
                price=item1.split(',')[3]
                drop_off_date=Date.today()
                 ticket_number=rand(0..10000)
                item_array=[ticket_number,item2,price,drop_off_date,drop_off_date+1]
                item_array_total=item_array_total.push(item_array)

             
                # prompt = TTY::Prompt.new
                # pickup_date=prompt.select("When would like to pich up your garments?", %w(tomorrow one_day_later two_days_days))
                # puts "Tanks, this is your ticket,please keep the ticket to pich up your garments "
                table = Terminal::Table.new :headings => ["Ticket_number","Item","Price","Total","Drop_Off Date","Delieved Date"], :rows => item_array_total

                 puts table
                end
                

            end
        end 
    end
            
end
laundry_display(["SHIRTS/SHORT","SKIRTS"]) 