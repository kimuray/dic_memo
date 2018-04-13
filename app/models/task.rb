class Task < ApplicationRecord
  belongs_to :user
  belongs_to :line

  validates :content, presence: true
end
