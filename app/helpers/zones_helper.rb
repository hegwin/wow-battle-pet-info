module ZonesHelper
  def show_zones(zones)
    zones.collect {|z| z.title_cn}.join(', ')
  end
end
