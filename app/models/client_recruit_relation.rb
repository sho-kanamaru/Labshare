class ClientRecruitRelation < ApplicationRecord
    def self.getUserIdByRecruitId(recruits)
        user_ids = recruits.map{ |recruit| ClientRecruitRelation.find_by(recruit_id: recruit.id)}
    end
end
