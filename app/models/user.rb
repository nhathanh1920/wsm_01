class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  belongs_to :position
  belongs_to :department

  has_many :project_members
  has_many :projects, through: :project_members
  has_many :user_skills
  has_many :skills, through: :user_skills

  enum gender: {female: 0, male: 1, other: 3}
  enum role: {admin: 0, user: 1}
end
