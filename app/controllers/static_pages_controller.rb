class StaticPagesController < ApplicationController
  include SessionsHelper

  def home
    if logged_in?
      @back_end = generate_category_data(1)
      @front_end = generate_category_data(2)
      @infra = generate_category_data(3)
    end
  end

  private

    def generate_category_data(category) {
      "先々月" => study_time_for_category(category, Time.now.prev_month(2).month),
      "先月" => study_time_for_category(category, Time.now.prev_month.month),
      "今月" => study_time_for_category(category, Time.now.month)
    }
    end

    def study_time_for_category(category, month)
      current_user.items.where(category: category, month: month).sum(&:study_time)
    end
end
