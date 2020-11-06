class LikesController < ApplicationController
    before_action :find_article

    def create

        if already_liked?
            flash[:notice] = "You can't like more than once"
          else
            @article.likes.create(user_id: current_user.id)
          end
        redirect_to article_path(@article)
    end

    private
    def already_liked?
      Like.where(user_id: current_user.id, article_id:
      params[:article_id]).exists?
    end
    
    def find_article
        @article =Article.find(params[:article_id])
    end

    
end
