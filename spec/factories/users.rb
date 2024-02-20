FactoryBot.define do
  factory :user do
    name { "h" * 50 }
    email { "hogehogehogehoge@example.com" }
    password { "hogehogepassword1" }
    profile_text { "h" * 50 }
    # Active Storageに関するファクトリー
    avatar_image { Rack::Test::UploadedFile.new("spec/fixtures/sample.jpeg", "image/jpeg") }
  end
end
