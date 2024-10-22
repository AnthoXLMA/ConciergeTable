class TasksController < ApplicationController

  # L'index classifie l'ensemble des modèles créés et répertoriés dans la
  # base de données.
  def index
    @tasks = Task.all
  end
  # La méthode SHOW est faite pour obtenir l'ensemble de l'information sur l'unité
  # d'un modèle créé.
  def show
    @task = Task.find(params[:id])
  end

  # la méthode NEW est faite pour ouvrir la colonne TASK dans le but d'y
  #ajouter un nouveau modèle
  def new
    @categories = Category.all
    @task = Task.new
  end

  # Une fois, la méthode NEW ouverte, la méthode CREATE va récupérer les nouvelles
  # données du modèle en création et sauvegarder ces données afin de refermer la colonne qui
  # contiendra ce nouveau modèle.
  def create
    @task = Task.new(tasks_params)
    @task.save
      redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:nom, :nom_du_client, :date_d_echeance, :date_de_demande, :description, :category)
  end
end
