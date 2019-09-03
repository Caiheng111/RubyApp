


users=[
    user1={
        name:"Heng",
        password:"admin3728"
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



    

prompt = TTY::Prompt.new
puts "Welcome to the DRY CLEANING SERVICE,Please LOG IN NOW...."
choose=prompt.select("Are you a user or a customer?", %w(user customer))

name=prompt.select("Please choose the user name?", %w(Heng  Hannah Upa Hevvon))


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
 
Log_in("Heng","admin719",users)

# def reset_password()
    #     puts "Pleaase input your username again"
    #     name=gets.strip()
    #     time=0
    #     while time < 3
    #         puts "please enter your new password"
    #         puts "> "
    #         password_one=gets.strip()
    #         puts "please enter your new password again"
    #         puts "> "
    #         password_two=gets.strip()
    #         if password_one==password_two
    #             users.each do |user|
    #                 if user[:nmae]==name
    #                 users[:password]=password_one
    #                 puts "You already reseted your password," 
    #                 break
    #                 elsif
    #                 password_one != password_two  
    #            end  
    #         end
    #     time+=1
    #     end
    # end


