class CommentsController < ApplicationController
  before_action :set_blog_post
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @blog_post.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_post_path(@comment.blog_post_id), notice: "Comment was successfully created" }
        format.js { render :create }
      else
        format.html { redirect_to blog_posts_path }
        format.js { render :new }
      end

    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to blog_post_path( @comment.blog_post_id), notice: 'Comment was successfully updated.'
    else
      redirect_to blog_post_path
    end
  end

  def destroy
    if @comment.destroy
      redirect_to blog_post_path(@comment.blog_post), notice: 'Comment was successfully destroyed.'
    end
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end

  def set_comment
    @comment = @blog_post.comments.find(params[:id])
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:comment_entry)
  end
end
