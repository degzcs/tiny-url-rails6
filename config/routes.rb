Rails.application.routes.draw do
  root 'url_info#index'
  get '/' => 'url_info#index'
  post '/url-info' => 'url_info#create'
  get '/:token' => 'url_info#redirect'
  get '/:token/info' => 'url_info#show'
end
