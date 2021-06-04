class GithubScoreCalculator
  def initialize(events, score_params)
    @events = events
    @score_params = score_params
  end

  def call
    grouped_events.map do |event_type, events|
      event_score = score_params[event_type] || 1
      event_score * events.count
    end.sum
  end

  private

  attr_reader :events, :score_params

  def grouped_events
    events.group_by { |event| event['type'] }
  end
end
