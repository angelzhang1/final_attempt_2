class HomeController < ApplicationController
  def index
    self.load_current_user
    if @current_user
      matching_verbs = Verb.where({ :user_id => @current_user.id })
      @verb_of_the_day = matching_verbs.sample
    else
      matching_verbs = Verb.all
      @verb_of_the_day = matching_verbs.sample
    end
    #hi
    #matching_verbs = Verb.all
    #@verb_of_the_day = matching_verbs.sample
    render({ :template => "home/index.html.erb" })
  end
end
