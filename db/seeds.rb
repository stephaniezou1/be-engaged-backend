# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

Hometown.destroy_all
User.destroy_all
Election.destroy_all
Follow.destroy_all

# hometown1 = Hometown.create!(
#     pollingLocations: "Associated Blind, 135 West 23 Street,
#     city: New York, state: NY, zip: 10011"
# )

hometown1 = Hometown.create!(
    pollingLocations: {
        "locationName": "Sorry, we couldn't find polling locations near you"
    }.to_json
)

stephanie = User.create!(
    name: "Stephanie", 
    email: "steph.zou16@gmail.com", 
    password: "abc123", 
    line1: "200 E 11th Street", 
    city: "New York", 
    state: "NY", 
    zip_code: "10003",
    hometown_id: hometown1.id
)

alisha = User.create!(
    name: "Alisha", 
    email: "alishazou@gmail.com", 
    password: "abc123", 
    line1: "375 N La Cienega Blvd", 
    city: "West Hollywood", 
    state: "CA", 
    zip_code: "90048",
    hometown_id: hometown1.id
)

naomi = User.create!(
    name: "Naomi", 
    email: "naomielegant@gmail.com", 
    password: "abc123", 
    line1: "20722 2nd Avenue West", 
    city: "Cudjoe Key", 
    state: "FL", 
    zip_code: "33042",
    hometown_id: hometown1.id
)

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

10.times do 
    Follow.create(
        user: naomi,
        election: Election.all.sample
    )
end


