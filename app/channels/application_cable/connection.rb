module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :quiz_id

    def connect
      # This can all be replaced by       self.quiz_id = cookies['quiz_id']
      # except that we all have cookies already in our browsers and you need to create a new team to establish the quiz_id cookie
      # team = Team.find(cookies['team_id'])
      # quiz_id = team.quiz.id
      # self.quiz_id = quiz_id
      self.quiz_id = cookies['quiz_id']
    end
  end
end
