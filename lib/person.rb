require 'house_period'

class Person
  attr_reader :house_periods, :id
  attr_accessor :name
  #attr_accessor :id
  
  @@id = 10001
  
  def initialize(name, override_id = nil)
    @name = name
    @house_periods = []
    if override_id
      @id = override_id
    else
      @id = @@id
      @@id = @@id + 1
    end
  end
  
  # Adds a single continuous period when this person was in the house of representatives
  # Note that there might be several of these per person
  def add_house_period(params)
    @house_periods << HousePeriod.new(params.merge(:person => self))
  end
  
  def display
    puts "Member: #{@name.informal_name}"
    @house_periods.each do |p|
      puts "  start: #{p.from_date} #{p.from_why}, end: #{p.to_date} #{p.to_why}"    
    end    
  end
  
  # Returns true if this person has a house_period with the given id
  def has_house_period_with_id?(id)
    !find_house_period_with_id(id).nil?
  end
  
  def find_house_period_with_id(id)
    @house_periods.find{|p| p.id == id}
  end
  
  def ==(p)
    id == p.id && name == p.name && house_periods == p.house_periods
  end
end
