class Inform < ApplicationRecord
  validates :content, presence: { message: 'テキストを入力してください' }
  validates :content, length: { maximum: 20, too_long: '20文字以内で入力してください' }
  validates :end_time, presence: { message: '時間を設定してください' }
end
