class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_fields
  has_many :fields, through: :user_fields
  has_many :client_recruit_relations
  has_many :recruits, through: :client_recruit_relations
  has_one :worker_recruit_relation
end
