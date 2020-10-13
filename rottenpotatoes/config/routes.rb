Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'find_by_director/:id' => 'movies#find_by_director', as: :find_by_director
end
