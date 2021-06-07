class WelcomeController < ApplicationController
  def index
    @github_info = GithubUser.new('brianzanti')
  end
end
