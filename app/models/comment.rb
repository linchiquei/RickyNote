class Comment < ApplicationRecord
  belongs_to :user #這個也要加
  belongs_to :note #這個也要加

  validates :content, presence: true
end
