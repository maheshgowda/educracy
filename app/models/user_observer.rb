class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.deliver_registration_confirmation(user)
  end
end