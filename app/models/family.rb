class Family < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :aikotoba, presence: true

  has_many :speakers
end
