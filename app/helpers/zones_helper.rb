module ZonesHelper
  def show_zones(zones)
    zones.collect {|z| z.title}.join(', ')
  end
end
