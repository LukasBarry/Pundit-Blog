class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to blog_post_path(@comment.blog_post_id), notice: "Comment was successfully created"
    else
      redirect_to blog_posts_path
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to blog_post_path( @comment.blog_post_id), notice: 'Comment was successfully updated.'
    else
      redirect_to blog_post_path
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to blog_post_path(@comment.blog_post), notice: 'Comment was successfully destroyed.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_entry, :author, :blog_post_id, :user_id)
  end

end
