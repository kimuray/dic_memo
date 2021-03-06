class Line < ApplicationRecord
  acts_as_list

  belongs_to :user
  belongs_to :project
  has_many :tasks, -> { order(:position) }, dependent: :destroy

  validates :title, presence: true
end
