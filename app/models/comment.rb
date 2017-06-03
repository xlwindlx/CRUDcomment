class Comment < ActiveRecord::Base
    belongs_to :post
    belongs_to :user
    validates :content, presence: {message: "빈칸은 안되요"}
    # 댓글 내용이 빈칸이면 안됨    true
end
