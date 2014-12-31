class ArticlesController < ApplicationController
  layout false

  def search
    days_ago = (params[:period] == 'NA') ? nil : Time.current - params[:period].to_i.days
    @articles = Article.order('publication_date DESC')
    @articles = @articles.where(read_status: nil) if params[:status] != 'all'
    @articles = @articles.where(journal: params[:journals][1..-1].split(','))
    @articles = @articles.where('publication_date > ?', days_ago) if days_ago.present?
    @articles = @articles.fuzzy_search(title: params[:input]) if params[:input].present?
    @articles = @articles.paginate(page: params[:page], per_page: 20)
  end

  def mark_as_read
    Article.all.each(&:mark_as_read)
    redirect_to root_path
  end

  def refresh
    Journal.all.each(&:index_new_articles)
    redirect_to root_path
  end
end
