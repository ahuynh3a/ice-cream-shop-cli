

class IceCream
  attr_accessor :flavor

  def initialize 
    @flavor = flavor
  end
  
  def recommend
    flavor_found = false
    puts "\n"
    puts "What flavors do you recommend we add to our list of options?"
    self.flavor = gets.chomp
    IceCreamShop::FLAVORS.each do |current_flavor|
      if current_flavor == "#{@flavor}"
        puts "#{@flavor} is already an option."
        puts "Would you like to recommend another flavor?"
        flavor_found = true
        break
      end
    end
    unless flavor_found
      puts "Thank you for reccomending #{@flavor}, we'll make sure it is avliabile the next time you visit!"
      IceCream.add_flavor("#{@flavor}")
    end 
  end 

  def self.add_flavor(new_flavor)
    IceCreamShop::FLAVORS.push(new_flavor)
  end
end

new_flavor = IceCream.new
new_flavor.recommend
