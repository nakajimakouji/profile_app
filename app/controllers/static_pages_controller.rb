class StaticPagesController < ApplicationController
  def home
    @this_month_backend_study_time = current_user.items.where(category: 1, month: Time.now.month).sum(&:study_time)
    @this_month_frontend_study_time = current_user.items.where(category: 2, month: Time.now.month).sum(&:study_time)
    @this_month_infra_study_time = current_user.items.where(category: 3, month: Time.now.month).sum(&:study_time)
    @last_month_backend_study_time = current_user.items.where(category: 1, month: Time.now.prev_month.month).sum(&:study_time)
    @last_month_frontend_study_time = current_user.items.where(category: 2, month: Time.now.prev_month.month).sum(&:study_time)
    @last_month_infra_study_time = current_user.items.where(category: 3, month: Time.now.prev_month.month).sum(&:study_time)
    @two_month_ago_backend_study_time = current_user.items.where(category: 1, month: Time.now.prev_month(2).month).sum(&:study_time)
    @two_month_ago_frontend_study_time = current_user.items.where(category: 2, month: Time.now.prev_month(2).month).sum(&:study_time)
    @two_month_ago_infra_study_time = current_user.items.where(category: 3, month: Time.now.prev_month(2).month).sum(&:study_time)
  end
end
