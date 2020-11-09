module Api
    module V1
        class ArticlesController < ApplicationController
            # before_action :doorkeeper_authorize!
            
            skip_before_action :authenticate_user!
            protect_from_forgery with: :null_session
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

            def update
                article=Article.find(params[:id])
                if article.update(article_params)
                    render json: {status: :'Success',message:'article updated',data:article}
                else
                    render json: {data:article.errors}
                end
                
            end
            def destroy
                article=Article.find(params[:id])
                article.destroy
                render json: {status: :'SUCCESS',message:'Deleted Article',data:article}
            end
            
            private
            def article_params
                params.require(:article).permit(:title, :body, :user_id)
            end


        end
    end

end
