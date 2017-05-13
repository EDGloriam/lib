require 'faker'
require './suport_classes'
class Library
	attr_accessor :books,	:orders, :readers,	:authors

	def initialize(books=[], orders=[], readers=[], authors=[])
		@books = books
		@orders = orders
		@readers = readers
		@authors = authors    # VS @authors, @books, @readers, @orders = authors, books, readers, orders
	end

	def data(operation, file_name = "data.yaml")
		case operation
			when :write
				File.open(file_name, 'w') { |file| file.write(self.to_yaml) }
				puts "file was written. success\n\n"
			when :read
				 lib = YAML.load(File.open(file_name))
					@books = lib.books
					@orders = lib.orders
					@readers = lib.readers
					@authors = lib.authors
					puts "file was loaded. success\n\n"
			else
				"eror. maybe you didn't pass operation(:read / :write)"
		end
	end

	def how_many
		books = find_by_options(:book, 3)
			p @orders.select{|order| books.reject{|item| !item.instance_of? Book}.
					collect{|obj| obj.title}.include?(order.book.title)}.length
	end

	def book_lover
		reader = find_by_options(:reader, 1)
		  puts "#{reader.first.name} (has read books: #{reader.last})\n\n"
	end

	def favorite_book
		book = find_by_options(:book, 1)
			puts "#{book.first.title} (was taken #{book.last} times) \n\n"
	end

	def generate_data
    20.times { @authors << Author.new(Faker::Book.author,"biography") }
 		50.times {@readers << Reader.new({name: Faker::Name.name,
                                    			 email: Faker::Internet.email,
                                    			 city: Faker::Address.city,
		                                       street: Faker::Address.street_name,
		                                       house: Faker::Address.building_number})}
 		30.times { @books << Book.new(Faker::Book.title, @authors.sample) }
 		100.times { @orders << Order.new(@books.sample, @readers.sample) }
	end

		private

			def find_by_options(object, desired_quantity = 1)
				temp_hash = Hash.new(0)
				results =[]

				@orders.each do | order |
						temp_hash[order.send(object)] += 1
				end
				searching_res_sorted = temp_hash.sort_by {|key, value| value}.reverse
				searching_res_sorted.each do | item |
							results << Array.[](item.first, item.last)
							break if results.length === desired_quantity
				end
				results.flatten
			end

end




