class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comments = Commnets.find(params[:comment_id])
    @comments.destroy
    redirect_to 'article/index', :notice => "Comment was deleted"
  end
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
