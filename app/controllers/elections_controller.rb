class ElectionsController < ApplicationController

    before_action :find_election, only: [:show, :edit, :update]

    def index
      @elections = Election.all 
      render json: @elections
    end

    def show 
        render json: @election
      end
    
      def update
        @election.update(election_params)
        render json: @election
      end
    
      private
      def find_election
        @election = Election.find(params[:id])
      end
    
      def election_params
        params.require(:election).permit(:electionId, :name, :electionDay, :ocdDivisionId)
      end

end
