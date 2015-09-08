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
		puts "Please input the name of the contact."
		name = STDIN.gets.chomp.to_s
		puts "Please input the email of the contact."
		email = STDIN.gets.chomp.to_s
		#binding.pry
		Contact.create(name,email)
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