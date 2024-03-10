require 'rails_helper'

RSpec.describe "Users", type: :system do

  before do
    driven_by(:rack_test)
  end

  scenario "プロフィール画像を更新すること" do
    expect {
      visit root_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログインする"
      expect(page).to have_content "自己紹介"

      click_link "自己紹介を編集する"
      attach_file 'user[avatar_image]', "#{Rails.root}/spec/fixtures/sample2.jpeg"
      # 画像が変更されてるかを検証するテスト

      click_button "自己紹介を確定する"
      expect(current_path).to eq root_path
      expect(page).to have_content "情報を変更しました"
    }
  end
end