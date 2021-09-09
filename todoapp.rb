class Todoapp
    attr_accessor :id , :subject , :description

    def initialize(id,subject,description)
        @id=id
        @subject=subject
        @description=description
    end
end



def get_value
    puts "Enter id"
    id=gets.to_i
    puts "Enter subject"
    subject=gets
    puts "Enter description"
    description=gets
    return id,subject,description
end

def exit
    puts "Do you want again (y/n)"
    wish=gets.chop.downcase
    if wish.eql?("y")
     menu()
    else
        puts "************************"
        puts "*  thank you!!         *"
        puts "*  Exiting .........   *"
        puts "************************"
    end 
end

def menu
puts "*********************************"
puts "*  1. To view the list          *"
puts "*  2. To create the record      *"
puts "*  3. To delete the record      *"
puts "*  4.To update the record       *"
puts "*********************************"
puts "Enter the choice from the menu"
ch = gets.chomp.to_i
    case ch
        when 1
            puts "Sn. \t Subject \t Description "
            $list.each do |l|
            puts "#{l.id} \t #{l.subject} \t #{l.description} \t"
            end
            exit()
        when 2
            id , subject, description = get_value()
            task = Todoapp.new(id,subject,description)
            $list.push(task)
            puts "Successfully Created !!"    
            exit()
        when 3
            puts "enter the id to delete"
            num=gets.to_i
            $list.delete_if {|x| x.id == num } 
            puts "successfully Deleted !!"
            exit()
        when 4
            puts "enter the id to Update"
            num=gets.to_i
            value = $list.select { |x| x.id == num }
            unless value.first.nil? 
            puts "your current todo is :"
            puts "#{value.first.id} \t #{value.first.subject} \t #{value.first.description}"
            puts "Enter new values:"
            puts "New Subject :"
            value.first.subject = gets
            puts "New description"
            value.first.description=gets
            puts "Successfully Updated !!"
            exit()
            else 
                puts "Sorry no record found !!"
                exit()
            end
        else
            puts "Sorry no match found"
            exit()
    end  
end
$list = []
menu()