class User < ApplicationRecord
    
    # belongs_to :hometown, optional: true
    belongs_to :hometown

    has_many :elections, through: :follows
    has_many :follows

    has_secure_password

    validates :email, uniqueness: { case_sensitive: false }

    def update_hometown
        api_key = ENV['google_api_key']
        hometowns = RestClient.get "https://www.googleapis.com/civicinfo/v2/voterinfo?key=#{api_key}&address=#{self.line1}%20#{self.city}%20#{self.state}%20#{self.zip_code}&electionId=2000"
            results = JSON.parse(hometowns)
        # byebug;    
        if results["pollingLocations"]
            polling_addresses = results["pollingLocations"][0]["address"].to_json
            @hometown = Hometown.find_or_create_by(pollingLocations: polling_addresses)
        else
            @hometown = Hometown.first
        end
        self.update(hometown: @hometown)
    end

end
