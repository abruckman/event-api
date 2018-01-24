class Pairing < ApplicationRecord
  # has_many :candidacies
  # has_many :users, through: :candidacies
  has_and_belongs_to_many :users
  has_and_belongs_to_many :events, uniq: true

  def get_events()
    first_events = self.users[0].events
    second_events= self.users[1].events

    events_hash = {}
    first_events.each_with_object(events_hash) do |event, events_hash|
      event_id = event.id
      if events_hash[event_id]
        events_hash[event_id] += 1
      else
        events_hash[event_id] = 1
      end
    end

    second_events.each_with_object(events_hash) do |event, events_hash|
      event_id = event.id
      if events_hash[event_id]
        events_hash[event_id] += 1
      else
        events_hash[event_id] = 1
      end
    end

    events_hash.select! do |key, value|
      value >= 2
    end

    events_hash.keys.each do |key|
      event = Event.find(key)

      if self.events.include?(event)
        # puts "looks like its already here"
      else
        # p self.events
        self.events << event
        # p self.events
      end
    end
    # p self.events.length
  end

  def set_rating
    rating = []


    self.users.each_with_object(rating) do |user, rating|
      for i in 0...self.events.length
        rank = user.get_interest_rank(self.events[i])
        points = 1000 / (rank + 2 )
        rating << points
      end
      rating
    end
    p '%' * 40
    p rating
    total = rating.sum
    p total
    Pairing.update(self.id, {rating: total})

  end

end
