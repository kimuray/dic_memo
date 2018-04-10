class Project < ApplicationRecord
  belongs_to :user

  has_many :assigns, dependent: :destroy
  has_many :assigned_users, through: :assigns, source: :user
  has_many :lines, dependent: :destroy

  validates :title,  presence: true, length: { maximum: 50 }
  def self.assigned!(project, emails)
    emails.each do |email|
      user, password = User.create_from_email!(email)
      next if user.nil? && password.nil?
      user.assigns.create!(project_id: project.id) unless Assign.find_by(project_id: project.id, user_id: user.id)
      AssignMailer.sendmail_assigned(user, password, project).deliver unless password.empty?
    end
  end
end
