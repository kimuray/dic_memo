class Project < ApplicationRecord
  belongs_to :user
  has_many :assigns, dependent: :destroy
  has_many :assigned_users, through: :assigns, source: :user
end
