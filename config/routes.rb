Rails.application.routes.draw do
  #homepage
  get("/", { :controller => "home", :action => "index" })
end
