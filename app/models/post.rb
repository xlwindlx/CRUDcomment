class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: {message: "제목 빈칸은 안되요"}
    # validates :content, presence: {message: "내용 빈칸은 안되요"}
    # 글 제목, 내용이 빈칸이면 안됨
    mount_uploader :image_url, CruduploaderUploader
end
