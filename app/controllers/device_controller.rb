class DeviceController < ApplicationController
  def create
    device = PushParam.find_or_initialize_by endpoint: params[:subscription][:endpoint]
    device.attributes = device_params
    device.save! if device.changed?
    head :ok
  end

  private

  def device_params
    params.require(:subscription)[:keys].permit(%i(p256dh auth))
  end
end
