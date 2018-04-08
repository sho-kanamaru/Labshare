module WorkersHelper
  def get_recruits
    if user_signed_in?
      if current_user.fields.length != 0
        current_user.fields.map{|f| f.recruits}.flatten
      else
        Recruit.all
      end
    else
      Recruit.all
    end
  end
end
