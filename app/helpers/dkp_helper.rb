module DkpHelper
  def is_admin?
    user_signed_in? && current_user.rank >= 2
  end

end
