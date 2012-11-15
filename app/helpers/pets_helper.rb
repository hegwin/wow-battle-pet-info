module PetsHelper
  def show_hit_rate(number)    
    if number >= 100
      nil
    else
      number_to_percentage number, precision: 0
    end
  end
end
