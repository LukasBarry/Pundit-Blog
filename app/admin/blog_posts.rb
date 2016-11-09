ActiveAdmin.register BlogPost do
  permit_params :title, :blog_entry, :created_at

  scope :all
  scope :your_posts do |blog_posts|
    blog_posts.your_posts(current_user)
  end
  scope :other_posts do |blog_posts|
    blog_posts.other_posts(current_user)
  end

  action_item :comments, only: :show do
    link_to 'Comments', admin_blog_post_comments_path(blog_post)
  end

  filter :user_name_cont, label: 'User Name'
  filter :title_cont, label: 'Title'
  filter :blog_entry_cont, label: 'Blog Entry'
  filter :created_at

  controller do
    def scoped_collection
      BlogPost.includes(:user)
    end
  end

  index do
    column :title
    column :blog_entry
    column "User Name", sortable: 'users.name' do |blog_post|
      blog_post.user.name
    end
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
