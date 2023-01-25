class HomeController < ApplicationController
  before_action :check_session, only: [:index]

  def index
    @articles = Article.search_articles(params)
    ip = session[:user_id]
    @query = params[:query]
    save_search(@query, ip)
  end  

  private

  def save_search(query, session)
    return if query.nil? || query.length < 3

    recent_search = Search.new(user_params)
    recent_search.ip_address = session
    session_search = Search.where(ip_address: session).last
    if session_search.nil? || !session_search.searched?(query)
      recent_search.save
    elsif session_search.query.length < query.length
      session_search.update(query: query)
    end
  end

  def user_params
    params.permit(:query)
  end

  def check_session
    session[:user_id] = SecureRandom.urlsafe_base64(16) if session[:user_id].nil?
  end
end
