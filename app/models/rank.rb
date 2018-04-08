class Rank < ApplicationRecord
  belongs_to :field

    def self.clientRankAverage(users)
        aves = users.map{ |user|
            ave = 0.0 #rank平均
            ranks = Rank.where(to_id: user.id).where(field_id: 1) #rankテーブルから自分あてのランク一覧を持ってくる
            ranks.each do |rank|
                ave += rank.rank
            end
            ave = ave/ranks.size #ave計算
        }
    end

    def self.getRecruitRankAverage(user_id,recruits)

        aves = recruits.map{ |recruit|
            ave = 0.0 #rank平均
            ranks = Rank.where(to_id: user_id).where(field_id: 1) #rankテーブルから自分あてのランク一覧を持ってくる
            ranks.each do |rank|
                ave += rank.rank
            end
            ave = ave/ranks.size #ave計算
        }
    end
end
