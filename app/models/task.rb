class Task < ApplicationRecord
  acts_as_list

  belongs_to :user
  belongs_to :line

  validates :content, presence: true
end
