Rails.application.routes.draw do
  # Routes for the Verb resource:

  # CREATE
  post("/insert_verb", { :controller => "verbs", :action => "create" })
          
  # READ
  get("/verbs", { :controller => "verbs", :action => "index" })
  
  get("/verbs/:path_id", { :controller => "verbs", :action => "show" })
  
  # UPDATE
  
  post("/modify_verb/:path_id", { :controller => "verbs", :action => "update" })
  
  # DELETE
  get("/delete_verb/:path_id", { :controller => "verbs", :action => "destroy" })

  #------------------------------

  # Routes for the Grammatical person resource:

  # CREATE
  post("/insert_grammatical_person", { :controller => "grammatical_people", :action => "create" })

  # READ
  get("/grammatical_people", { :controller => "grammatical_people", :action => "index" })

  get("/grammatical_people/:path_id", { :controller => "grammatical_people", :action => "show" })

  # UPDATE

  post("/modify_grammatical_person/:path_id", { :controller => "grammatical_people", :action => "update" })

  # DELETE
  get("/delete_grammatical_person/:path_id", { :controller => "grammatical_people", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

  #homepage
  get("/", { :controller => "home", :action => "index" })

  #my page
  get("/my_page", { :controller => "user_authentication", :action => "show" })
end
