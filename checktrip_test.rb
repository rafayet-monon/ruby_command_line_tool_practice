require "test/unit"
require './checktrip_program.rb'

class ChecktripTest < Test::Unit::TestCase
  include Printables

  STATIONS = %w[ADL BRI MEL SYD]

  def test_print_stations
    assert_equal "The available stations are #{STATIONS}", print_stations(STATIONS), "Printables.print_stations should return a string with parameters.'"
  end

  def test_invalid_station_numbers
    assert_equal "Must input at least two stations i.e. 'checktrip STATION_X STATION_Y'", invalid_station_numbers, "Printables.invalid_station_numbers should return a string.'"
  end

  def test_invalid_stations
    assert_equal "Station names are invalid. Valid stations: #{STATIONS}", invalid_stations(STATIONS), "Printables.invalid_stations should return a string with parameters.'"
  end

  def test_wrong_arguments
    assert_equal 'Wrong number of arguments', wrong_number_of_arguments, "Printables.wrong_number_of_arguments should return a string.'"
  end

  def test_trip_possible
    assert_equal 'Trip is possible.', trip_possible, "Printables.trip_possible should return a string.'"
  end

  def test_trip_impossible
    assert_equal 'Trip is impossible.', trip_impossible, "Printables.trip_impossible should return a string.'"
  end

  def test_perform_no_parameters
    checktrip = Checktrip.new
    assert_equal "The available stations are #{STATIONS.join(', ')}", checktrip.perform, "Checktrip.perform should return available stations."
  end

  def test_perform_wrong_parameter_number
    Checktrip.new('ADL').perform
    assert_raise(RuntimeError) {raise 'Wrong number of arguments'}
  end

  def test_perform_faulty_parameters
    Checktrip.new('ADL', 'AAA').perform
    assert_raise(RuntimeError) {raise "Station names are invalid. Valid stations: #{STATIONS.join(', ')}"}
  end

  def test_perform_possible_parameters
    station_x = 'ADL'
    station_y = 'BRI'
    checktrip = Checktrip.new(station_x, station_y)
    assert_equal "Trip is possible.", checktrip.perform, "Checktrip.perform should return possible."
  end

  def test_perform_impossible_parameters
    station_x = 'SYD'
    station_y = 'ADL'
    checktrip = Checktrip.new(station_x, station_y)
    assert_equal "Trip is impossible.", checktrip.perform, "Checktrip.perform should return impossible."
  end
end