class IceCream
  attr_accessor :flavor

  def initialize 
    @flavor = flavor
  end
  
  def recommend
    flavor_found = false
    puts "\n"
    puts "What flavors do you recommend we add to our list of options?"
    self.flavor = gets.chomp.capitalize
    IceCreamShop::FLAVORS.each do |current_flavor|
      if current_flavor == "#{@flavor}"
        puts "#{@flavor} is already an option."
        puts "\n"
        puts "Would you like to recommend another flavor?"
        puts "\n"
        puts "1. Yes "
        puts "2. No "
        response=gets.chomp.to_i
        if response == 1
          self.add_another_flavor
        else
          puts "Thank you for recommending! Please come back if any new ice cream flavors come to mind!"
        end
        flavor_found = true
        break
      end
    end
    unless flavor_found
      puts "Thank you for reccomending #{@flavor}, we'll make sure it is available the next time you visit!"
      IceCream.add_flavor("#{@flavor}")
    end 
  end 

def self.add_flavor(new_flavor)
    IceCreamShop::FLAVORS.push(new_flavor)
  end
end

def add_another_flavor
  self.recommend
end
