class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, except: [:index, :user_posts]
  after_action :verify_policy_scoped, only: [:index, :user_posts]


  def index
    @blog_posts = policy_scope(BlogPost.includes(:comments)).order(created_at: :desc)
    @comment = Comment.all
  end

  def show
    @comment = Comment.new blog_post: @blog_post
  end

  def new
    @blog_post = current_user.blog_posts.new
    authorize @blog_post
  end

  def edit
  end

  def create
    @blog_post = current_user.blog_posts.create(blog_post_params)
    authorize @blog_post
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new
    end
  end

  def update
    notice = if params[:event] == 'publish'
               @blog_post.publishing!
               'Blog post was successfully published.'
             elsif params[:event] == 'unpublish'
               @blog_post.drafting!
               'Blog post was reverted to draft.'
             elsif @blog_post.update(blog_post_params)
               'Blog post was successfully updated.'
             end
    if notice
      redirect_to @blog_post, notice: notice
    else
      render :edit
    end
  end

  def destroy
    @blog_post.destroy
      redirect_to blog_posts_path
  end

  def user_posts
    @blog_posts = policy_scope(current_user.blog_posts).order(created_at: :desc)
  end

  private

  def user_not_authorized
    redirect_to request.referrer || blog_posts_path,
    notice: "You are not authorized to perform this action."
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
    authorize @blog_post
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :blog_entry, :author, :user_id, tags_attributes: [:id, :name, :_destroy])
  end

end
