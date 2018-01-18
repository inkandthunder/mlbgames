#require 'httparty'
require 'pp'
#require "mlbgames/version"

require 'nokogiri'
require 'open-uri'
require 'HTTParty'

module Mlbgames
  HOST = 'gd2.mlb.com'
  PROTO = 'http'
  PORT = 80
  BASEPATH = '/components/game/mlb'
  BASE_URL = PROTO + '://' + HOST + BASEPATH + '/'
  
  class Gameday
    attr_accessor :year, :month, :day

    @@games = []

    def initialize(year, month, day)
      self.year = year
      self.month = month
      self.day = day
      @@games << self
      #TARGET = BASE_URL + 'year_' + year + '/month_' + month + '/day_' + day + '/grid.json' 
    end

    def self.search(obj)
      HTTParty.get(obj.to_s).parsed_response
    end

    def to_s
     BASE_URL + "year_#{year}/month_#{month}/day_#{day}/grid.json" 
    end
  
  end

  p1 = Gameday.new('2016', '07', '18')

  #puts Gameday.search(p1)
  
  #TARGET = BASE_URL + 'year_2016/month_08/day_20/grid.json'
  #puts BASE_URL
  #puts TARGET

  #pp HTTParty.get(TARGET).parsed_response

  #pp HTTParty.get(BASE_URL + 'year_2016/month_08/day_20/').parsed_response
end
