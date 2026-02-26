class User < ApplicationRecord
  has_secure_password

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end