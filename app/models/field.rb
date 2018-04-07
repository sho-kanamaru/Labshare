class Field < ApplicationRecord
  has_many :user_fields
  has_many :users, through: :user_fields
  has_many :recruits
  has_many :ranks
end
