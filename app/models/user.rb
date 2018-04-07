class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_fields
  has_many :fields, through: :user_fields

  # fieldをuserの項目に入れるのに必要
  attr_accessor :field
end
