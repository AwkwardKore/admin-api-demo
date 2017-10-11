ActiveAdmin.register User do
  permit_params :name, :last_name, :email, :password, :password_confirmation, :address

  index do
    column :name
    column :last_name
    column :email
    column :address
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :address
    end
    f.actions
  end
end
