class IceCreamShop
  attr_accessor :order

  FLAVORS = ["Vanilla", "Chocolate", "Strawberry", "Mint Chocolate Chip","Ube","Cookies and Cream","Green Tea"]
  
  def initialize
    @order = {}
  end

  def display_menu
    puts "Welcome to the Ice Cream Shop!"
    puts "Here are our available flavors:"
    puts"\n"
    FLAVORS.each_with_index {|flavor, index| puts "#{index + 1}. #{flavor}" }
  end

  def take_order
    loop do
      self.display_menu
      puts "Enter the number corresponding to the flavor you want to order (or 'exit' to finish):"
      input = gets.chomp.downcase

      if input == 'exit'
        break
      end

      flavor_index = input.to_i - 1
      if flavor_index >= 0 && flavor_index < FLAVORS.length
        puts "How many scoops of #{FLAVORS[flavor_index]} would you like?"
        number_of_scoops = gets.chomp.to_i

        @order[FLAVORS[flavor_index]] ||= 0
        @order[FLAVORS[flavor_index]] += number_of_scoops
        puts 

        puts "#{number_of_scoops} scoops of #{FLAVORS[flavor_index]} added to your order."
      else
        puts "Invalid input. Please enter a valid number."
      end
    end
  end

def display_order
    puts "\nYour order summary:"
    @order.each do |flavor, number_of_scoops|
      puts "#{flavor}: #{number_of_scoops} scoops"
    end
  end
end

require_relative "ice_cream"

# Main program
ice_cream_shop = IceCreamShop.new
ice_cream_shop.take_order
ice_cream_shop.display_order
