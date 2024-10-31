class PagesController < ApplicationController
  def home
    @tasks                = Task.all
    @today_tasks          = Task.where(date_d_echeance: Date.today)
  end

  def yesterday
  end

  def today
  end

  def tomorrow
  end
end
