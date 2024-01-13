
class IceCreamShop
  
  attr_accessor :order

  FLAVORS = ["Vanilla", "Chocolate", "Strawberry", "Mint Chocolate Chip","Ube","Cookies and Cream","Green Tea"]
  
  def initialize
    @order = {}
  end

  require_relative "ice_cream"

  def how_may_i_help
    ice_cream_shop= IceCream.new
    first_enter_shop = true
    loop do
    puts"\n"
    if first_enter_shop == true
      puts "Welcome to the Ice Cream Shop! How can I help you today?"
      first_enter_shop = false
    else
      puts "How else can I help you?"
    end
    puts "\n"
    puts "Please choose an option by selecting a number from the list below:"
    puts "\n"
    puts "1. Place an order"
    puts "2. Recommend a flavor"
    puts "3. Exit simulation"
    puts "\n"
    users_choice = gets.chomp.to_i
    case users_choice
      when 1
        self.take_order
      when 2
        ice_cream_shop.recommend
      when 3
        puts"\n"
        puts "Thanks for stopping by! See you again next time!"
        break
      else
        puts"\n"
        puts "Sorry, I am not sure how I can help, try picking another option from the list."
      end
    end
  end 

  def display_menu
    puts "Amazing! Here are our available flavors:"
    puts"\n"
    FLAVORS.each_with_index {|flavor, index| puts "#{index + 1}. #{flavor}" }
  end

  def adding_to_order
    puts "Great Choice! What else would you like?"
    puts"\n"
    puts "Here are our available flavors:"
    puts"\n"
    FLAVORS.each_with_index {|flavor, index| puts "#{index + 1}. #{flavor}" }
  end


  def take_order
    display_menu_first_time = true
    loop do
      puts"\n"
      if display_menu_first_time
        self.display_menu
        display_menu_first_time = false
      else
        self.adding_to_order
      end
      puts"\n"
      puts "Enter the number corresponding to the flavor you want to order (or 'exit' to finish your order):"
      input = gets.chomp.downcase
      
      if input == 'exit'
        puts"\n"
        self.display_order
        break
      end

      flavor_index = input.to_i - 1
      if flavor_index >= 0 && flavor_index < FLAVORS.length
        puts"\n"
        puts "How many scoops of #{FLAVORS[flavor_index]} would you like?"
        number_of_scoops = gets.chomp.to_i
        @order[FLAVORS[flavor_index]] ||= 0
        @order[FLAVORS[flavor_index]] += number_of_scoops
        puts"\n"
        puts "#{number_of_scoops} scoops of #{FLAVORS[flavor_index]} added to your order."
      else
        puts "Sorry, #{input} is not an option. Please choose another option from the list."
      end

    end
  end

def display_order
    puts "\nYour order summary:"
    @order.each do |flavor, number_of_scoops|
      puts "#{number_of_scoops} scoops of #{flavor} ice cream"
    end
  end
end
