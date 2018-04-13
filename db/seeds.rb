# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  user = User.create(email: 'test@example.com', password: 'password', name: 'テスト 太郎')
  project = Project.create(user: user, name: 'テストプロジェクト')
  3.times do |index|
    Line.create(user: user, project: project, title: "ライン#{index}")
  end
end
