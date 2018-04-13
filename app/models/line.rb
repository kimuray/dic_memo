class Line < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
end
