class User < ApplicationRecord
    
    belongs_to :hometown, optional: true

    has_many :elections, through: :follows
    has_many :follows

    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }
end
