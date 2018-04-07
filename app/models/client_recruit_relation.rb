class ClientRecruitRelation < ApplicationRecord
  belongs_to :user
  belongs_to :recruit

  def self.getUserByRecruitId(recruits)
    users = recruits.map{ |recruit| ClientRecruitRelation.find_by(recruit_id: recruit.id)}.delete_if{|recruit| recruit == nil}
  end
end
