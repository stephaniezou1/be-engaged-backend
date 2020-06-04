# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

Election.destroy_all

stephanie = User.create(name: "Stephanie", email: "steph.zou16@gmail.com", password: "abc123", line1: "200 E 11th Street", city: "New York", state: "NY", zip_code: "10003")
alisha = User.create(name: "Alisha", email: "alishazou@gmail.com", password: "abc123", line1: "375 N La Cienega Blvd", city: "West Hollywood", state: "CA", zip_code: "90048")
naomi = User.create(name: "Naomi", email: "naomielegant@gmail.com", password: "abc123", line1: "20722 2nd Avenue West", city: "Cudjoe Key", state: "FL", zip_code: "33042")

api_key = ENV['google_api_key']
elections = RestClient.get "https://www.googleapis.com/civicinfo/v2/elections?key=#{api_key}"
elections_object = JSON.parse(elections)["elections"]
# byebug;
elections_object.each do |election|
    Election.create(
        electionId: election["id"],
        name: election["name"],
        electionDay: election["electionDay"],
        ocdDivisionId: election["ocdDivisionId"]
    )
end
puts "elections seeded"


