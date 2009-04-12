class IntroductionController < ApplicationController
  def index
    respond_to do |wants|
      wants.html # index.html.erb
    end
  end
end
