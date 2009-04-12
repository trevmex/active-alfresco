# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #
  # Require the RestClient to talk to Alfresco
  #
  require "rubygems"
  require "rest_client"
  require "json"

  #
  # Returns a ticket to alfresco to use
  #
  def authenticate_to_alfresco
    username = 'rubyonrails'
    password = 'sliarnoybur'
    login_url = 'http://localhost:8080/alfresco/service/api/login'
    
    #
    # This is the ticket to pass webscripts as alf_ticket for access
    #
    alf_ticket = JSON.parse(RestClient.post(login_url, JSON.generate('username' => username, 'password' => password), :content_type => 'application/json'))['data']['ticket']
  end
  
  #
  # Validates the given alf_ticket.
  # if invalid, gets a new one.
  #
  def validate_ticket(alf_ticket)
    response = RestClient.get('http://localhost:8080/alfresco/service/api/login/ticket/'+alf_ticket+'?alf_ticket='+alf_ticket)
    
    if !response
      authenticate_to_alfresco
    else
      alf_ticket
    end
  end
end
