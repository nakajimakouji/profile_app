# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# データベースが空の状態から実行
User.create!(email: "hogehoge@example.com", password: "foobar1", password_confirmation: "foobar1", profile_text: "a" * 50)

# カテゴリーが増えたら連動できる
categories = ["バックエンド", "フロントエンド", "インフラ"]
categories.each do |category|
  Category.create!(name: category)
end

Item.create!(name: "Ruby", study_time: 40, user_id: 1, category_id: 1)
Item.create!(name: "Rails", study_time: 40, user_id: 1, category_id: 1)
Item.create!(name: "MySQL", study_time: 40, user_id: 1, category_id: 1)
Item.create!(name: "HTML", study_time: 40, user_id: 1, category_id: 2)
Item.create!(name: "CSS", study_time: 40, user_id: 1, category_id: 2)
Item.create!(name: "Heroku", study_time: 40, user_id: 1, category_id: 3)
Item.create!(name: "AWS", study_time: 40, user_id: 1, category_id: 3)
Item.create!(name: "Firebase", study_time: 40, user_id: 1, category_id: 3)