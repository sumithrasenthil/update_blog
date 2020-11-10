ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :firstname, :lastname, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  permit_params :firstname, :lastname, :email
  # or
  #
  # permit_params do
  #   permitted = [:firstname, :lastname, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
 
  filter :articles
  filter :id 
  filter :email , as: :select, collection: ->{User.all}
  filter :firstname
  filter :lastname
  index  do
    column :firstname
    column :lastname
    column :email
    column :id
    
      actions
  end
  # form do |f|
  #   f.inputs "New Entry" do
  #     f.input :firstname
  #     f.input :lastname
  #     f.input :email
  #   end
  #   f.actions
  # end
  

end
