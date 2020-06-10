class Follow < ApplicationRecord
  
  belongs_to :user
  belongs_to :election

  validates :election_id, uniqueness: { scope: :user_id }

end
