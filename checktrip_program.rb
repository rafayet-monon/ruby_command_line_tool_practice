module Printables
  def print_stations(stations)
    "The available stations are #{stations}"
  end

  def invalid_station_numbers
    "Must input at least two stations i.e. 'checktrip STATION_X STATION_Y'"
  end

  def invalid_stations(stations)
    "Station names are invalid. Valid stations: #{stations}"
  end

  def wrong_number_of_arguments
    'Wrong number of arguments'
  end

  def trip_possible
    'Trip is possible.'
  end

  def trip_impossible
    'Trip is impossible.'
  end
end

class Checktrip
  require 'json'
  include Printables

  attr_accessor :data, :input, :station_list, :station_x, :station_y

  # constructor
  def initialize(station_x=nil, station_y=nil)
    @data = JSON.parse file
    @station_list = @data['stations'].join(', ')
    @station_x = station_x.nil? ? nil : station_x.upcase
    @station_y = station_y.nil? ? nil : station_y.upcase
  end

  # this public method performs all the actions to get appropriate output.
  def perform
    return print_stations(station_list) if station_x.nil? && station_y.nil?

    validate_stations

    station_possibility
  rescue => e
    e
  end

  private

  # this method reads the file
  def file
    if File.exist?('/usr/local/bin/station.json')
      File.read '/usr/local/bin/station.json'
    else
      File.read './station.json'
    end
  end

  # this method shifts the 'checktrip' and then turn words to upcase
  # then it checks if it has both source and destination and the stations are valid.
  def validate_stations
    raise wrong_number_of_arguments if station_x.nil? || station_y.nil?

    raise invalid_stations(station_list) unless valid_stations
  end

  # checks validity of the input stations
  def valid_stations
    station_array = station_list.delete(' ').split(',')

    station_array.include?(station_x) && station_array.include?(station_y)
  end

  # this method finds if the trip is possible or not
  def station_possibility
    message = trip_impossible # saves the trip_impossible to meesage variable
    links = data['links'] # station links from the json
    raise message if links[station_x].nil? # checks if source has links.

    loop_array = links[station_x] # initializes the loop array
    loop_array.each do |x|
      if x == station_y           # checks if the station matches the destination
        message = trip_possible   # then sets the message to possible and breaks the loop.

        break
      end

      links[x]&.each do |x1|
        if x1 == station_y          # checks if the station matches the destination
          message = trip_possible   # then sets the message to possible and breaks the loop.

          break
        end

        loop_array.push(x1) unless x1 == station_x  # pushes the x1 to loop_array to check it's links.
      end
      # checked_array.push(loop_array.shift)

      break if message == trip_possible
    end

    message # returns the message
  end
end