Rails.application.routes.draw do
  get 'wiki/:article_id', to: 'articles#show'
end
