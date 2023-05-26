Rails.application.routes.draw do
  resources "places"
  resources "posts"
  resources "sessions"
  resources "users"
  
  get "/", :controller => "places", :action => "index"
  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"

end
