class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :body, :article_id, :created_at
end
