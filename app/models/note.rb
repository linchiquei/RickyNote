class Note < ApplicationRecord
    validates :title, presence: true
    #validates :content, presence: true
    #validates (:column, {presence: true})
end