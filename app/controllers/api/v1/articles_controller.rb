module Api
  module V1
    class ArticlesController < ApplicationController

      protect_from_forgery with: :null_session

      # GET /api/v1/articles
      def index
        articles = Article.available?

        render json: ArticleSerializer.new(articles, options).serialized_json
      end

      # GET /api/v1/articles/1
      def show
        article = Article.find(params[:id])

        render json: ArticleSerializer.new(article, options).serialized_json
      end

      # POST /api/v1/articles
      def create
        article = Article.new(article_params)

        if article.save
          render json: ArticleSerializer.new(article, options).serialized_json, status: :created, location: [:api, :v1, article]
        else
          render json: article.errors, status: :unprocessable_entity # status :422
        end
      end

      # PATCH/PUT /api/v1/articles/1
      def update
        article = Article.find(params[:id])

        if article.update(article_params)
          render json: ArticleSerializer.new(article, options).serialized_json
        else
          render json: article.errors, status: :unprocessable_entity # status :422
        end
      end

      # DELETE /api/v1/articles/1
      def destroy
        article = Article.find(params[:id])

        if article.destroy
          head :no_content
        else
          render json: article.errors, status: :unprocessable_entity # status :422
        end
      end


      private

      # Use callbacks to share common setup or constraints between actions.
      def set_article
        article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :content, :visible)
      end

      def options
        @options ||= { include: [:comments] }
      end
      
    end
  end
end