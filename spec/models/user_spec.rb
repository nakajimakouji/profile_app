require "rails_helper"

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '正しい値ならバリデーションに通ること' do
      user = User.new(
        name: "hogehoge",
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_valid
    end
    it 'ネームが51文字ならバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 51,
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'Eメールが256文字ならバリデーションに失敗すること' do
      user = User.new(
        name: "hogehoge",
        email: "a" * 244 + "@example.com",
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'ネームがnilのときバリデーションに失敗すること' do
      user = User.new(
        name: nil,
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'ネームが空文字のときバリデーションに失敗すること' do
      user = User.new(
        name: "",
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'Eメールがnilのときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: nil,
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'Eメールが空文字のときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "",
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'メールアドレスにふさわしくない値になっていないときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehogeexample.com",
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'すでにDB内に同じメールアドレスが存在するときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      user.save
      user = User.new(
        name: "a" * 50,
        email: "hogehoge@example.com",
        password: "hogehogepassword2",
        profile_text: "foobarfoobarfoobarfoobarfoobarfoobarfoobarfoobarfoobarfoobarfoobarfoobarfoobarfoobarfoobar"
      )
      expect(user).to be_invalid
    end
    it 'パスワードがnilのときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: nil,
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'パスワードが空文字のときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: "",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'パスワードが5文字のときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: "hogeh",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it 'パスワードにふさわしくない値になっていないときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: "hogehogepassword",
        profile_text: "hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge"
      )
      expect(user).to be_invalid
    end
    it '自己紹介文がnilのときでもバリデーションに成功すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: nil
      )
      expect(user).to be_valid
    end
    it '自己紹介文が空文字のときでもバリデーションに成功すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: ""
      )
      expect(user).to be_valid
    end
    it '自己紹介文が200文字のときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: "h" * 200
      )
      expect(user).to be_invalid
    end
    it '自己紹介文が49文字のときバリデーションに失敗すること' do
      user = User.new(
        name: "h" * 50,
        email: "hogehoge@example.com",
        password: "hogehogepassword1",
        profile_text: "h" * 49
      )
      expect(user).to be_invalid
    end

    it '画像がJPEGでもPNGでもない画像のときにバリデーションに失敗すること' do
      user = FactoryBot.build(:user, avatar_image: Rack::Test::UploadedFile.new("spec/fixtures/sample.gif", "image/gif"))
      expect(user).to be_invalid
    end

    it '容量が500KBを超える画像の場合にバリデーションに失敗すること' do
    end
    
    # TODO: エラーメッセージのテスト

  end

  describe 'コールバック' do
    it '大文字を含んだメールアドレスを入力して保存したら全て小文字に変換されること' do
      user = FactoryBot.create(:user, email: "HOGEHOGE@example.com")
      expect(user.email).to eq "hogehoge@example.com"
    end
  end
end
