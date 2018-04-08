class Recruit < ApplicationRecord
  has_many :messages
  belongs_to :field
  has_many :client_recruit_relations
  has_many :users, through: :client_recruit_relations

  def self.getMyRecruitList(user_id)
    recruit_ids = ClientRecruitRelation.where(user_id: user_id)
    my_recruits = recruit_ids.map{ |a| Recruit.find(a.recruit_id)}
  end

  def self.getAppliedRecruitList(worker_id)
      recruits = WorkerRecruitRelation.where(user_id: worker_id)
      applied_recruits = recruits.map{ |a| Recruit.find(a.recruit_id)}
  end
end
