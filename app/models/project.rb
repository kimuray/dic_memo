class Project < ApplicationRecord
  belongs_to :user
  has_many :assigns, dependent: :destroy
end
