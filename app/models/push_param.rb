class PushParam < ApplicationRecord
  validates :p256dh, presence: true
  validates :auth, presence: true
  validates :endpoint, presence: true
end
