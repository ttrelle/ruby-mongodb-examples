require 'mongoid'

class Artist 
	include Mongoid::Document
	field :name, type: String
	embeds_many :instruments
end

class Instrument
  include Mongoid::Document
  field :name, type: String
  embedded_in :artist
end	

# Verbindung zur lokalen MongoDB
Mongoid.load!("mongoid.yml", :development)

a = Artist.new(name: "Front 242")
a.insert
a.instruments.create(name: "Korg K1")

b = Artist.where(name: "Front 242")
puts b