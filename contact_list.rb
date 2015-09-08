require_relative 'contact'
require_relative 'contact_database'
require 'pry'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

class ContactList
	@@id = 0
	def initialize(choice)
		@choice = choice
		start
	end

	def start
		case @choice
		when "help"
			help
		when "new"
			new_contact
		when "list"
			list
		when "show"
			show
		when "find"
			find
		else
			puts "Nothing happened."
		end
	end

	def help
		puts "Here is a list of available commands:"
		puts "new - Create a new contact"
		puts "list - List all contacts"
		puts "find - Find a contact"
	end

	def new_contact
		array=Array.new
		phone_hash=Hash.new
		puts "Please input the email of the contact."
		email = STDIN.gets.chomp.to_s
		check_email = Contact.duplicate?(email)
		if check_email == true
			puts "Duplicate email detected."
			new_contact
		else
		end
		puts "Please input the name of the contact."
		name = STDIN.gets.chomp.to_s
		loop do 
			puts "Add a number? Yes or no?"
			input = STDIN.gets.chomp.downcase
			if input == "yes"
				puts "Please input phone number. First specify type (e.g mobile, home)"
				puts "Second, put in your number in XXX-XXX-XXXX format. "
				type = STDIN.gets.chomp
				phone = STDIN.gets.chomp
				phone_hash[phone] = type
			elsif input == "no"
				break
			else
				puts "Please specify yes or no."
			end
		end
		#binding.pry
		Contact.create(name,email,phone_hash)
	end

	def list
		Contact.all
	end

	def show
		id = ARGV[1]
		Contact.show(id)
	end

	def find
		id = ARGV[1]
		Contact.find(id)
	end
end

ContactList.new(ARGV[0].downcase)


# class New 

# end