class Book
	attr_accessor :title, :author

	def initialize(title, author)
		@title = title
		@author = author
	end
end

class Order
	attr_accessor :book, :reader
	attr_reader :date

	def initialize(book, reader)
		@book = book
		@reader = reader
		@date = Time.new.strftime('%Y-%m-%d %H:%M:%S')
	end

end

class Reader
	attr_accessor :name, :email, :city, :street, :house

	def initialize(args_hash)
		@name = args_hash[:name]
		@email = args_hash[:email]
		@city = args_hash[:city]
		@street = args_hash[:street]
		@house = args_hash[:house]
	end

end

class Author
	attr_accessor :author_name, :biography

	def initialize(name, biography)
		@author_name = name
		@biography = biography
	end
end