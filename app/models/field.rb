class Field < ApplicationRecord
  has_many :user_fields
  has_many :fields, through: :user_fields
end
