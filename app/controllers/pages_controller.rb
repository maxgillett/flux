class PagesController < ApplicationController
  def home
    #journals = params[:journals].split(',')
    #time_period = params[:time_period]

    @articles = Article.order('publication_date DESC')
    if params[:search].present?
      @articles = @articles.basic_search('Neuron')
    end
    @articles = @articles.paginate(page: params[:page], per_page: 20)
  end
end
