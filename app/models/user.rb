class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :trackable, :validatable

  has_many :projects
  has_many :assigns, dependent: :destroy
  has_many :assigned_projects, through: :assigns, source: :project

  def self.assigned!(assign_params, user_params, project)
    emails = user_params.split("\s")
    emails.each do |email|
      email.strip!
      password = ""
      next if ((/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) =~ email).nil?
      if User.find_by(email: email)
        user = User.find_by(email: email)
      elsif User.find_by(email: email).nil?
        password = SecureRandom.hex(10)
        user = User.create!(name: "user_0#{User.last.id + 1}", email: email, password: password)
      end
      user.assigns.create!(assign_params) if Assign.find_by(project_id: assign_params[:project_id], user_id: user.id).nil?
      AssignMailer.sendmail_assigned(user, password, project).deliver unless password.empty?
    end
  end

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
