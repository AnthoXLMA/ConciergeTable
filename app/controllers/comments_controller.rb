class CommentsController < ApplicationController

  def new
    @task = Task.find(params[:task_id])
    @comment = Comment.new
  end

  def create
    @task           = Task.find(params[:task_id])
    @comment        = Comment.new(comment_params)
    @comment.task   = @task
    if @comment.save
      redirect_to tasks_path(@task)
    else
      render "tasks/show"
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:review)
  end

end
