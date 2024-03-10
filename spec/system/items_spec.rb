require 'rails_helper'

RSpec.describe "Items", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }

  before do
    driven_by(:rack_test)
  end

  describe 'create' do
    scenario "アイテムが作られること" do
      expect {
        visit root_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        click_button "ログインする"
        expect(page).to have_content "自己紹介"

        click_link "編集する"
        click_link "項目を追加する"
        fill_in "item_name", with: "Test"
        find("#item_study_time").find("option[value='1']").select_option
        click_button "追加する"
        click_link "編集ページに戻る"
        expect(page).to have_content category.name
        expect(page).to have_content "Test"
        expect(page).to have_content 1
      }.to change(user.items, :count).by(1)
    end
  end

  describe 'update' do
    let!(:item) { FactoryBot.create(:item, user: user, category: category, month: Time.current.month) }
    scenario "アイテムの学習時間が更新されること" do
      visit root_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログインする"
      expect(page).to have_content "自己紹介"
      
      click_link "編集する"
      expect(page).to have_content 5000
      find("#item_study_time").find("option[value='1']").select_option
      click_button "学習時間を保存する"
      click_link "編集ページに戻る"
      expect(page).to have_content category.name
      expect(page).to have_content "Test"
      expect(page).to have_content 1
    end
  end

end
