module Api
    module V2
        class ArticlesController < ApplicationController
            before_action :doorkeeper_authorize!
            before_action :require_permission, only: [:edit, :update, :destroy]
            skip_before_action :authenticate_user!
            protect_from_forgery with: :null_session
            def index
                
                # articles =Article.all
                articles =Article.where("user_id =?", doorkeeper_token[:resource_owner_id]);
                render json: {message:'Articles',data:articles}
            end


        end
    end

end
