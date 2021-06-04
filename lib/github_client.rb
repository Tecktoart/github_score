class GithubClient < BaseClient
  def initialize(username)
    @username = username
  end

  def events
    get( "https://api.github.com/users/#{username}/events/public")
  end

  private

  attr_reader :username
end
