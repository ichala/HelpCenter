class Article < ApplicationRecord


    def self.search_articles(params)
        # get 3 recent articles if no query is present or get articles that match the query
        if params[:query].blank?
          all.order(id: :desc).limit(3)
        else
          where(
            'lower(title) LIKE :query OR lower(body) LIKE :query', query: "%#{params[:query].downcase}%"
          )
        end
      end

      
end
