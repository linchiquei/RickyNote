class Note < ApplicationRecord
    validates :title, presence: true
    #validates :content, presence: true
    #validates (:column, {presence: true})

    def self.available
        where(deleted_at: nil)
    end

    default_scope {where(deleted_at: nil)}
    #所有查詢裡面都會加上這段

    #belongs_to :users
end