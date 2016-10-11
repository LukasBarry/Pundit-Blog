ActiveAdmin.register BlogPost do
  permit_params :title, :blog_entry, :created_at

  scope :all
  # scope :your_posts
  # scope :other_posts

  action_item :comments, only: :show do
      link_to 'Comments', admin_blog_post_comments_path(blog_post)
    end

  filter :user, as: :check_boxes
  filter :title_cont, label: 'Title'
  filter :blog_entry_cont, label: 'Blog Entry'
  filter :created_at

  index do
    column :title
    column :blog_entry
    column :created_at
    actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
