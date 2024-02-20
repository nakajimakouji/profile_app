require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "ログイン画面を表示" do
    visit root_path
    expect(page).to have_content "ログイン"
  end

  scenario "ログイン画面でメールアドレスとパスワードを入力したらログインできること" do
    user = FactoryBot.create(:user)
    visit root_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
    expect(page).to have_content "自己紹介"
    expect(page).to have_content user.name
    expect(page).to have_content user.profile_text
  end
end
