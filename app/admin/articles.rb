ActiveAdmin.register Article do
  

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :title, :body, :id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted

  show do
    attributes_table do
      row :title
      row :body
      row :user
      table_for resource.comments do
        column "Comments", :body
        column :user
      end

      
    end
  
  end


  # show do
  #   panel "Table of contents" do
    
  #     table_for resource.comments do
        
  #       column :body
        
  #     end

  #   end
  
  # end


  filter :title
  filter :user  
  filter :id, label: "Article" , as: :select, collection: ->{Article.all}
  index do 
    column "Article Id",:id
    column :title
    column :user
    column "User Id",:user_id
    actions

  end

  
end
