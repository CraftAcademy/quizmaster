module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :quiz_id

    def connect
      self.quiz_id = cookies['quiz_id']
    end
  end
end
