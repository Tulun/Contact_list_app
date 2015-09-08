class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
      @name = name
      @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact

    return self
  end
 
  ## Class Methods
  class << self
    @@id = 0
    def create(name, email, phone_hash)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      #IDEALLY:
      #contact=Contact.new(name,email)
      array=Array.new
      read = CSV.read("contacts.csv", "r").length
      @@id = read + 1
      ## This converts the hash to an array so it writes properly
      phone_array = phone_hash.to_a.flatten
      array.push(@@id, name, email, phone_array.join(','))
      CSV.open("contacts.csv","ab") do |csv|
        csv.puts array
      end
    end
 
    def find(id)
      # TODO: Will find and return contacts that contain the term in the first name,
       #last name or email
      show_people = CSV.read("contacts.csv", "r").select {|c| (c[1] || c[2]) == id}
      pp show_people
    end

    def read_phone_numbers(show_person)
      if show_person[3]
        arr = show_person[3].split(',')
        show_person[3]=Hash[*arr]
      end
    end
 
    def all
      # TODO: Return the list of contacts, as is
      CSV.foreach("contacts.csv") do |row|
        read_phone_numbers(row)
        pp row
      end
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      show_person = CSV.read("contacts.csv", "r").detect {|c| c[0] == id}
      #### This converts the string into a readable array, then convert into a hash * is the splat operator
      #binding.pry
      read_phone_numbers(show_person)
      pp show_person
    end


    def duplicate?(email)
      CSV.read("contacts.csv", "r").detect {|c| c[2] == email} ? true : false
    end
    
  end
 
end