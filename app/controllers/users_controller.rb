class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.create(user_params())
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
        render json: @user
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :email, :password, :line1, :city, :state, :zip_code)
    end

end
