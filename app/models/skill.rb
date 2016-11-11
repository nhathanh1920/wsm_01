class Skill < ApplicationRecord
  belongs_to :company

  has_many :user_skills
  has_many :users, through: :users
end
