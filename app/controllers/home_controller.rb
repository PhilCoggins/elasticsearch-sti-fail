require_dependency "animal"

class HomeController < ApplicationController
  def index
    render plain: Elasticsearch::Model.search("Fluffy").records.to_a
  end
end
