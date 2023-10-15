class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # 数字、整数のみ、(greater_than)0以上
  validates :study_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
