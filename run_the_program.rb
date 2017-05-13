require './library'

lib = Library.new
lib.generate_data

puts 'The most popular book is:'
lib.favorite_book

puts 'Reader, who often takes a book:'
lib.best_reader

print 'Count of people, who read most popular books:'
lib.how_many
puts '-----------------------------------------------------------'

lib.data_write
lib.data_load
