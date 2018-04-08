module WorkersHelper
  def get_recruits
    if user_signed_in?
      if current_user.fields.length != 0
        recruits = current_user.fields.map{|f| f.recruits}.flatten
      else
        recruits = Recruit.all
      end
    else
      recruits = Recruit.all
    end
    return recruits.select{|recruit| recruit.status != 2}
  end
end
