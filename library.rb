require './generator'
class Library
  include DataForTesting
  attr_accessor :books, :orders, :readers, :authors

  def initialize(books = [], orders = [], readers = [], authors = [])
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end

  def data_write(file_name = 'data/data.yaml')
    File.open(file_name, 'w') { |file| file.write(self.to_yaml) }
    print "file was written. success\n"
  end

  def data_load(file_name = './data/data.yaml')
    lib = YAML.load(File.open(file_name))
    @books = lib.books
    @orders = lib.orders
    @readers = lib.readers
    @authors = lib.authors
    print "file was loaded. success\n"
  end

  def how_many
    books = find_best(:book, 3)
    @orders.select { |order| order.reader if books.include? order.book }
      .uniq.compact.count
  end

  def best_reader
    find_best(:reader)
  end

  def favorite_book
    find_best(:book)
  end

  private

  def find_best(obj, quantity = 1)
    arr = @orders.group_by(&obj).max_by(quantity) { |_, value| value.count }
    quantity == 1 ? arr.flatten.first : arr.flatten
  end
end
