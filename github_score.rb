require_relative 'lib/base_client'
require_relative 'lib/github_client'
require_relative 'services/github_score_calculator'

class GitHubScore
  SCORES = {
      "IssuesEvent" => 7,
      "IssueCommentEvent" => 6,
      "PushEvent" => 5,
      "PullRequestReviewCommentEvent" => 4,
      "WatchEvent" => 3,
      "CreateEvent" => 2
  }.freeze

  class << self
    def run
      puts "DHH's github score is #{github_score}"
    end

    private

    def github_score
      GithubScoreCalculator.new(github_events, SCORES).call
    end

    def github_events
      GithubClient.new('dhh').events
    end
  end
end

GitHubScore.run
