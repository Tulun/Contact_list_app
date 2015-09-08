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
    def create(id, name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      #IDEALLY:
      #contact=Contact.new(name,email)
      array=Array.new
      array.push(id, name, email)
      CSV.open("contacts.csv","ab") do |csv|
        csv.puts array
      end
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end
 
    def all
      # TODO: Return the list of contacts, as is
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
    
  end
 
end