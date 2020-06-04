# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'

Election.destroy_all

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

# Election.all_elections


# elections = [
#     {
#         "id": "2000",
#         "name": "VIP Test Election",
#         "electionDay": "2021-06-06",
#         "ocdDivisionId": "ocd-division/country:us"
#       },
#       {
#         "id": "4955",
#         "name": "West Virginia Presidential and State Primary Election",
#         "electionDay": "2020-06-09",
#         "ocdDivisionId": "ocd-division/country:us/state:wv"
#       },
#       {
#         "id": "4958",
#         "name": "Georgia Presidential and State Primary Election",
#         "electionDay": "2020-06-09",
#         "ocdDivisionId": "ocd-division/country:us/state:ga"
#       },
#       {
#         "id": "4964",
#         "name": "DC Presidential and State Primary Election",
#         "electionDay": "2020-06-02",
#         "ocdDivisionId": "ocd-division/country:us/district:dc"
#       },
#       {
#         "id": "4968",
#         "name": "New Mexico Presidential and State Primary Election",
#         "electionDay": "2020-06-02",
#         "ocdDivisionId": "ocd-division/country:us/state:nm"
#       },
#       {
#         "id": "4969",
#         "name": "North Dakota State Primary Election",
#         "electionDay": "2020-06-09",
#         "ocdDivisionId": "ocd-division/country:us/state:nd"
#       },
#       {
#         "id": "4970",
#         "name": "Nevada State Primary Election",
#         "electionDay": "2020-06-09",
#         "ocdDivisionId": "ocd-division/country:us/state:nv"
#       },
#       {
#         "id": "4971",
#         "name": "South Carolina State Primary Election",
#         "electionDay": "2020-06-09",
#         "ocdDivisionId": "ocd-division/country:us/state:sc"
#       },
#       {
#         "id": "4986",
#         "name": "Indiana Presidential and State Primary Election",
#         "electionDay": "2020-06-02",
#         "ocdDivisionId": "ocd-division/country:us/state:in"
#       },
#       {
#         "id": "4987",
#         "name": "Maryland Presidential and State Primary Election",
#         "electionDay": "2020-06-02",
#         "ocdDivisionId": "ocd-division/country:us/state:md"
#       },
#       {
#         "id": "4988",
#         "name": "Pennsylvania Presidential and State Primary Election",
#         "electionDay": "2020-06-02",
#         "ocdDivisionId": "ocd-division/country:us/state:pa"
#       },
#       {
#         "id": "4989",
#         "name": "Rhode Island Presidential Primary Election",
#         "electionDay": "2020-06-02",
#         "ocdDivisionId": "ocd-division/country:us/state:ri"
#       },
#       {
#         "id": "4990",
#         "name": "Louisiana Presidential and Municipal Primary Election",
#         "electionDay": "2020-07-11",
#         "ocdDivisionId": "ocd-division/country:us/state:la"
#       }
#     ]

