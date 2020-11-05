module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                articles =Article.order('Created_at DESC');
                render json: {message:'Articles',data:articles}
            end
            def show
                article =Article.find(params[:id])
                render json: {status: :'SUCCESS',message:'Article',data:article}
            end
            def new
                article =Article.new
            end

            def create
                article =Article.new(article_params)
                if article.save
                    render json: {data:article}
                else
                    render json: {data:article.errors}
                end


            end
            
            private
            def article_params
                params.permit(:title,:body,:user_id)
            end


        end
    end

end
