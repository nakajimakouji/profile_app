class StaticPagesController < ApplicationController
  def home
    @back_end = {
      "先々月" => current_user.items.where(category: 1, month: Time.now.prev_month(2).month).sum(&:study_time),
      "先月" => current_user.items.where(category: 1, month: Time.now.prev_month.month).sum(&:study_time),
      "今月" => current_user.items.where(category: 1, month: Time.now.month).sum(&:study_time)
    }
    @front_end = {
      "先々月" => current_user.items.where(category: 2, month: Time.now.prev_month(2).month).sum(&:study_time),
      "先月" => current_user.items.where(category: 2, month: Time.now.prev_month.month).sum(&:study_time),
      "今月" => current_user.items.where(category: 2, month: Time.now.month).sum(&:study_time)
    }
    @infra = {
      "先々月" => current_user.items.where(category: 3, month: Time.now.prev_month(2).month).sum(&:study_time),
      "先月" => current_user.items.where(category: 3, month: Time.now.prev_month.month).sum(&:study_time),
      "今月" => current_user.items.where(category: 3, month: Time.now.month).sum(&:study_time)
    }
  end
end
