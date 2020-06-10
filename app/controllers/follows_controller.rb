class FollowsController < ApplicationController
    before_action :authorized, only: [:stay_logged_in]
    before_action :set_follow, only: [:show, :destroy]

    def index
        @follows = Follow.all
        render json: @follows
    end

    def show
        render json: @follow
    end

    def create
        # byebug;
        # user_id = @user.id 
        user_id = params[:follow][:user_id]
        election_id = params[:follow][:election_id]
        # @follow = Follow.create(user_id: user_id, election_id: election_id)
        @follow = Follow.create(params.permit(:user_id, :election_id))
        if @follow.valid?
            render json: @follow, status: 201
        else
            render json: {message: "Couldn't follow this election"}
        end
    end

    def destroy
        # byebug;
        @follow.destroy
        render json: @follow
    end

    private

    def follow_params
        params.permit(:user_id, :election_id)
    end

    def set_follow
        @follow = Follow.find(params[:id])
    end
end
