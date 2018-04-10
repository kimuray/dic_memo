class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :trackable, :validatable

  has_many :projects
  has_many :assigns, dependent: :destroy
  has_many :assigned_projects, through: :assigns, source: :project
  has_many :lines, dependent: :destroy
  has_many :tasks

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  validates :name,  presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  def self.create_from_email!(email)
    email.strip!
    return if ((/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) =~ email).nil?
    password = ""
    if User.find_by(email: email)
      user = User.find_by(email: email)
    elsif User.find_by(email: email).nil?
      password = SecureRandom.hex(10)
      user = User.create!(name: "user_0#{User.last.id + 1}", email: email, password: password)
    end
    return user, password
  end
end
