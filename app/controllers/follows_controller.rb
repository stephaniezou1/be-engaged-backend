class FollowsController < ApplicationController
    before_action :authorized 

    def index
        @follows = Follow.all
        render json: @follows
    end

    def create
        user_id = @user.id 
        election_id = @election.electionId
        @follow = Follow.find_or_create_by(user_id: user_id, election_id: election_id)
        render json: {follow: FollowSerializer.new(@follow)}, status: 201
    end

    private

    def follow_params
        params.require(:follow).permit(:user_id, :election_id)
    end

    def find_follow
        params.require(:follow).permit(:user_id, :election_id)
    end
end
