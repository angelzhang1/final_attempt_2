class HomeController < ApplicationController
  def index
    #matching_verbs = Verb.all
    #@verb_of_the_day = matching_verbs.sample
    render({ :template => "home/index.html.erb" })
  end
end
