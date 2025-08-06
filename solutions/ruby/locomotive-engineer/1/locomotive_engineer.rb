class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first_wag, sec_wag, locomotive, *last_wag = each_wagons_id
    [locomotive] + missing_wagons + last_wag + [first_wag, sec_wag]
  end

  def self.add_missing_stops(from_to_stations, **stops)
    from_to_stations[:stops] = stops.values
    from_to_stations
  end

  def self.extend_route_information(route, more_route_information)
    # route.merge(more_route_information)
    {**route, **more_route_information}
  end
end
