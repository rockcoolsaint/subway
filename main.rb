class Journey
  attr_accessor :balance, :fares
  def initialize()
    @balance = 30
    
    @bus_fare = 1.80
    
    @fares = {
      :'5th' => 2.50,
      :pelham => [2.50, 3.00],
      :bronx => 2.00,
      :'guns hill' => 2.00
    }
  end
  
  def from_5th_pelham()
    puts "Entry point 5th Station you will be charged a maximum fare of $#{3.00}"
    
    max_fare = @fares[:pelham].max
    @balance -= max_fare
    
    puts "Your fare balance is $#{@balance}"
    print "do you want a bus trip? reply 'y' for yes or 'n' for no"
    print ">"
    
    bus = gets.strip
    case bus
    when 'n'
      fare = @fares[:pelham].min
      
      puts "You have been charged $#{fare} for this journey"
      
      @balance += max_fare - fare
      
      puts "Your actual fare balance is $#{@balance}"
    when 'y'
      fare = @bus_fare
      @balance += max_fare - fare
    
      puts "Your fare balance is $#{@balance}"
    end
  end
  
  def from_pelham_bronx()
    puts
    puts "Entry point from Pelham to bronx you will be charged $#{@fares[:bronx]}"
    print "do you want a bus trip? reply 'y' for yes or 'n' for no"
    print ">"
    
    bus = gets.strip
    case bus
    when 'y'
      puts "You will be charged $#{@bus_fare}"
      fare = @bus_fare
      @balance -= fare
      puts "Your fare balance is $#{@balance}"
    when 'n'
      puts "You will be charged $#{@fares[:bronx]}"
      fare = @fares[:bronx]
      @balance -= fare
      puts "Your fare balance is $#{@balance}"
    end
  end
  
  def from_pelham_gunshill()
    puts
    puts "Entry point from Pelham to Guns Hill you will be charged a maximum fare of $#{@fares[:'guns hill']}"
    print "do you want a bus trip? reply 'y' for yes or 'n' for no"
    print ">"
    
    bus = gets.strip
    case bus
    when 'y'
      puts "You will be charged $#{@bus_fare}"
      fare = @bus_fare
      @balance -= fare
      puts "Your fare balance is $#{@balance}"
    when 'n'
      puts "You will be charged $#{@fares[:'guns hill']}"
      fare = @fares[:'guns hill']
      @balance -= fare
      puts "Your fare balance is $#{@balance}"
    end
  end
end

myJourney = Journey.new

puts "Hello JourneyMan you are about to embark on a journey"
puts "and you have loaded.....$#{myJourney.balance}"
puts

def movement(myJourney)
  myJourney.from_5th_pelham
  myJourney.from_pelham_bronx
  myJourney.from_pelham_gunshill
end

movement(myJourney)