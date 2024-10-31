class TasksController < ApplicationController

  # L'index classifie l'ensemble des modèles créés et répertoriés dans la
  # base de données.
  def index
    @tasks                = Task.all
    @reviews              = Comment.where(task_id: :id)
    @tasks_chronology     = @tasks.order(date_d_echeance: :asc)
    @yesterday_tasks      = Task.where(date_d_echeance: Date.today - 1)
    @today_tasks          = Task.where(date_d_echeance: Date.today)
    @tomorrow_tasks       = Task.where(date_d_echeance: Date.today + 1)
    @dless_seven_tasks    = Task.where(date_d_echeance: Date.today >> 7)
    @dless_fifteen_tasks  = Task.where(date_d_echeance: Date.today >> 7)
    @dless_thirty_tasks   = Task.where(date_d_echeance: Date.today + 8)
  end
  # La méthode SHOW est faite pour obtenir l'ensemble de l'information sur l'unité
  # d'un modèle créé.
  def show
    @guest      = Guest.find(params[:guest_id])
    @task       = Task.find(params[:id])
    @tasks      = Task.where(guest_id: @guest)
    @this_task  = Task.where(id: @task)
    @comment    = Comment.new
  end
  # la méthode NEW est faite pour ouvrir la colonne TASK dans le but d'y
  #ajouter un nouveau modèle
  def new
    @categories = Category.all
    @guest      = Guest.find(params[:guest_id])
    @task       = Task.new
  end

  def create
    @guest         = Guest.find(params[:guest_id])
    @task          = Task.new(task_params)
    @task.guest    = @guest
    if @task.save
      redirect_to guest_path(@guest)
    else
      render "guests/show"
    end
  end

  private

  def task_params
    params.require(:task).permit(:nom, :nom_du_client, :date_d_echeance, :date_de_demande, :description, :category, :reviews, :status)
  end
end
