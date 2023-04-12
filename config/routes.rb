Rails.application.routes.draw do
  root 'translations#index'
  post 'translations/translate'
end

