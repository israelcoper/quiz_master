class User < ApplicationRecord
  has_secure_password
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  def full_name
    [first_name, last_name].join " "
  end
end
