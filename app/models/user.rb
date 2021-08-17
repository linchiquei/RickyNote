require 'digest/sha1'

class User < ApplicationRecord
    #attr_accessor :password_confirmation #no do it!
    validates :email, presence: true
    validates :password, presence: true, confirmation: true
    validates :account, presence: true
    # before_create do
    #     self.password = Digest::SHA1.hexdigest("zyx#{self.password}")
    # end

    before_create :add_password
    has_many :notes
    # u4 = User.find(14)
    # u4.notes = []
    # u4.notes
    # u4.notes.new(title: '123', content: '345')
    # u4.notes.create(title: '123', content: '345')
    
    private
    def add_password
        salt_pw = "zyx#{self.password}"
        self.password = Digest::SHA1.hexdigest(salt_pw)
    end

    #暴力破解法每次解的都記在資料庫裡
    #salting
end
