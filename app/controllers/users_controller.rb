class UsersController < ApplicationController

    before_action :authorized, only: [:stay_logged_in]
    before_action :set_user, only: [:show, :edit, :update]

    require 'rest-client'
    require 'twilio-ruby'
    require 'rubygems'
        
    def index
        @users = User.all
        render json: @users
    end
    
    def show
        render json: @user
    end
    
    def create
        api_key = ENV['google_api_key']
        hometowns = RestClient.get "https://www.googleapis.com/civicinfo/v2/voterinfo?key=#{api_key}&address=#{params["line1"]}%20#{params["city"]}%20#{params["state"]}%20#{params["zip_code"]}&electionId=2000"
        results = JSON.parse(hometowns)
        polling_addresses = results["pollingLocations"][0]["address"].to_json
        @hometown = Hometown.find_or_create_by(pollingLocations: polling_addresses)
        @user = User.create(
            name: params["name"],
            email: params["email"], 
            password: params["password"], 
            line1: params["line1"], 
            city: params["city"], 
            state: params["state"], 
            zip_code: params["zip_code"], 
            hometown_id: @hometown.id
        )
        if @user.valid?
            wristband = encode_token({user_id: @user.id})
        render json: {
            user: UserSerializer.new(@user),
            token: wristband
          }
        else
          render json: {message: "Failed to create a new user"}, status: 403
        end
    end

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            wristband = encode_token({user_id: @user.id})
            render json: {
                user: UserSerializer.new(@user), 
                token: wristband
            }
        else
            render json: {message: "Incorrect username or password"}
        end
    end

    def stay_logged_in
        wristband = encode_token({user_id: @user.id})
        render json: {
          user: UserSerializer.new(@user),
          token: wristband
        }
    end

    def update
        @user.update(user_params)
        @user.update_hometown
        render json: @user
    end

    def twilio(phone, text)
        account_sid = ENV['twilio_account_sid'] 
        auth_token = ENV['twilio_auth_token']
        @client = Twilio::REST::Client.new account_sid, auth_token
        message = @client.messages.create(
            body: text,
            to: phone,    
            from: ENV['twilio_phone_number']) 
        puts message.sid
    end

    def send_text
        @user = User.find(params[:id])
        message = "Thanks for signing up #{@user.name}, we will text you when the deadline of the election approaches"
        twilio(ENV['my_phone_number'], message)
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :email, :password, :line1, :city, :state, :zip_code, :hometown_id)
    end

end
