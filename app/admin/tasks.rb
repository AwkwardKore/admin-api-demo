ActiveAdmin.register Task do
  permit_params :title, :description, :user_id

  index do
    column :title
    column :description
    column 'User' do |task|
      task.user.name
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :description
      f.input :user
    end
    f.actions
  end

end
