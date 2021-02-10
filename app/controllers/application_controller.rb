class ApplicationController < ActionController::Base
  
  def hello
    render html: "from local this time"
  end
end
