class ApplicationController < ActionController::Base
  
  def hello
    render html: "from local"
  end
end
