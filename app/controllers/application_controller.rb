class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :vapid_public_key

  def vapid_public_key
    @decoded_vapid_public_key ||= Base64.urlsafe_decode64(Rails.application.secrets.vapid_public_key).bytes
  end
end
