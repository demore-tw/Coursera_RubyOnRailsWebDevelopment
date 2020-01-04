require "httparty"

class Recipe
  include HTTParty

  # FOOD2FORK_KEY = 9b6de0d7ef5f0412a953c5473c67c792
  base_uri "http://food2fork.com/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for (keyword)
    get("/search", query:{q:keyword})["recipes"]
  end
end
