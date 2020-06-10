class FollowsController < ApplicationController
    before_action :authorized, only: [:set_follow, :create, :destroy]
    before_action :set_follow, only: [:show, :destroy]

    def index
        @follows = Follow.all
        render json: @follows
    end

    def show
        render json: @follow
    end

    def create
        user_id = @user.id 
        election_id = params[:follow][:election_id]
        @follow = Follow.create(user_id: user_id, election_id: election_id)
        if @follow.valid?
            render json: @follow, status: 201
        else
            render json: {message: "Couldn't follow this election"}
        end
    end

    def destroy
        @follow.destroy
        render json: @follow
    end

    private

    def follow_params
        params.permit(:user_id, :election_id)
    end

    def set_follow
        @follow = @user.follows.find(params[:id])
    end
end
