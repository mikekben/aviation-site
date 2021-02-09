class ApplicationController < ActionController::Base
  
  def hello
    render html: "hello world, third time!"
  end
end
