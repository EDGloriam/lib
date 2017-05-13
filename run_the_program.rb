require 'faker'
require './suport_classes'
require './library'

puts "Welcom to Library"
puts "================="

lib=Library.new
lib.generate_data
puts "Reader, who often takes a book:"
lib.book_lover
puts "The most popular book is:"
lib.favorite_book
print "Count of people, who read most popular books: "
lib.how_many
puts "================================================"

lib.data :write
lib.data :read



