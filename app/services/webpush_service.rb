class WebpushService
  def initialize(user_id: nil)
    @user_id = user_id
  end

  def webpush_clients(message)
    devices.each do |device|
      webpush device, message
    end
  end

  def webpush(device, message)
    Webpush.payload_send(
      message: message,
      endpoint: device.endpoint,
      p256dh: device.p256dh,
      auth: device.auth,
      ttl: 24 * 60 * 60,
      api_key: "AAAAuXw35R4:APA91bFoa-2ZBoir4mQUh2YwspH0dW5boVEG_KDysHL4Cein-kt9iO_AJMkIrYJowWLT1bro1lJEoyOlH8uyN0BD_5085jA5q0n9mldF6GT8mfxymQeGxgMcssu52s_n5aHx5_6lPoaF"
#      vapid: {
#        subject: "mailto:flum.1025@gmail.com",
#        public_key: Rails.application.secrets.vapid_public_key,
#        private_key: Rails.application.secrets.vapid_private_key
#      }
    )
  end

  private

  def devices
    @user_id.present? ? PushParam.where(user_id: @user_id) : PushParam.all
  end
end
