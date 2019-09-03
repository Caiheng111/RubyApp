
require 'tty-font'
require "tty-prompt"
require 'colorize'
require 'terminal-table'
require 'csv'


def service_view()

    prompt = TTY::Prompt.new
    choices = %w(Laundry dry_clean Press_only)
    prompt.multi_select("Select drinks?", choices)
    if choice=="Laundry"
        csv=CSV.read("laundry_price.csv")
        heading=csv.first
        rows=csv[1..-1]
        table = Terminal::Table.new :headings => heading, :rows => rows
            puts table
    elsif choice=="dry_clean"
        
  
    

end
service_view()