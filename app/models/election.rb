class Election < ApplicationRecord
    has_many :follows
    has_many :users, through: :follows

    require 'httparty'
    # require 'civic_aide'

    def self.all_elections
        api_key = ENV['google_api_key']
        elections = JSON.parse(HTTParty.get("https://www.googleapis.com/civicinfo/v2/elections?key=#{api_key}").body)
        array_of_elections = elections["elections"]
        array_of_elections.each do |election_hash|
            Election.create!({
                electionId: election["id"],
                name: election["name"],
                electionDay: election["electionDay"], 
                ocdDivisionId: election["ocdDivisionId"]
            })
            puts "seeded elections"
        end
    end

end
