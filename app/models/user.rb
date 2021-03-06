class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  has_many :favorites
  has_many :plants, through: :favorites
  has_secure_password
  enum role: %w(default admin)
end
