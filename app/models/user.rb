class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :trackable, :validatable

  has_many :projects
  has_many :assigns, dependent: :destroy

  def self.assigned!(assign_params, user_params)
    emails = user_params[:email].split(",")
    informations = []
    emails.each do |email|
      email.strip!
      next if ((/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) =~ email).nil?
      if User.find_by(email: email)
        user = User.find_by(email: email)
      elsif User.find_by(email: email).nil?
        password = SecureRandom.hex(10)
        user = User.create!(name: "user_0#{User.last.id + 1}", email: email, password: password)
        informations << "#{user.email}の初期ユーザ名は#{user.name}で、初期パスワードは#{password}です。"
      end
      user.assigns.create!(assign_params) if Assign.find_by(project_id: assign_params[:project_id], user_id: user.id).nil?
    end
    informations
  end
end
