require_relative 'contact'
require_relative 'contact_database'
require 'pry'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

class ContactList

	def initialize
		@name = ""
		@email = ""
		@choice = ARGV[0].downcase
		start
	end

	def start
		case @choice
		when "help"
			help
		when "new"
			new
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

	def new
		array=Array.new
		puts "Please input the name of the contact.\n"
		@name = gets.chomp.to_s
		puts "Please input the email of the contact.\n"
		@email = gets.chomp.to_s
		array=array[@name, @email]
		binding.pry
		puts array
	end

end

ContactList.new



# class New 

# end