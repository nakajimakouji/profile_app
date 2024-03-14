class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  # 数字、整数のみ、(greater_than)0以上
  validates :study_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # 何を軸にするか（今回はname）
  validates :name, uniqueness: { scope: [:category_id, :year, :month, :user_id], message: "が被っています" }
end
