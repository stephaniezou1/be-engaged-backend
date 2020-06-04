class User < ApplicationRecord
    
    belongs_to :hometown
    has_many :elections, through: :follows
    has_many :follows

    has_secure_password
    validates_uniqueness_of :email
end
