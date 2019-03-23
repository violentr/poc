class WelcomeController < ApplicationController
  def index

  end

  def text
    render file: File.join(Rails.root, 'some_file')
  end
end
