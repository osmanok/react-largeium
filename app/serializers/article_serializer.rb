class ArticleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :visible, :created_at, :updated_at, :id

  has_many :comments 
end
