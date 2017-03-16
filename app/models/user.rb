class User < ApplicationRecord
  has_secure_password

  has_many :quizzes, dependent: :destroy

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  def full_name
    [first_name, last_name].join " "
  end
end
