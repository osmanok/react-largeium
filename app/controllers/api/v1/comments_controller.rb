module Api
  module V1
    class CommentsController < ApplicationController
      protect_from_forgery with: :null_session

      # Get /api/v1/articles/:article_id/comments
      def index
        comments = Comment.where(article_id: params[:article_id])

        render json: CommentSerializer.new(comments)
      end

      # SHOW /api/v1/articles/:article_id/comments/:id
      def show
        comment = Comment.find(params[:id])

        render json: CommentSerializer.new(comment)
      end

      # POST /api/v1/articles/:article_id/comments
      def create
        comment = Comment.new(comment_params)

        if comment.save 
          render json: CommentSerializer.new(comment)
        else
          render json: comment.errors.messages, status: :unprocessable_entity # status: 422
        end 
      end


      # DELETE /api/v1/articles/:article_id/comments/:id
      def destroy
        comment = Comment.find(params[:id])

        if comment.destroy 
          head :no_content
        else
          render json: comment.errors.messages, status: :unprocessable_entity # status: 422
        end
      end
      
      private

      def comment_params
        params.require(:comment).permit(:title, :body, :article_id)
      end

    end
  end
end