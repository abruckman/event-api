class User < ApplicationRecord
  has_many :interests
  has_many :events, through: :interests
  has_many :users, -> { distinct }, through: :events
  has_and_belongs_to_many :pairings
  has_many :pairs, ->{distinct}, through: :pairings, source: :users, class_name: "User"
    #code
  # @possibles = self.users

  # attr_accessor :users, :interests
  # def init
  #   @interests = self.interests
  #
  # end

  def set_interest_ranks()
    listo = self.interests
    listo.each_with_index do |interest, index|
      Interest.update(interest.id, {interest_rank: index})
    end
  end

  def set_pairs()
    possibles = self.users
    possibles.each do |pair|
      unless self.pairs.include?(pair)
        if self.gender_check(pair)
          new_pairing = Pairing.new({:users=>[self, pair]})
          new_pairing.get_events
          if new_pairing.events.length > 0
            new_pairing.save
          end
        end
      end
    end
  end

  def get_interest_rank(event)
    interest = Interest.find_by user_id: self.id, event_id: event.id
    interest.interest_rank
  end

  def gender_check(other)
    if self.gender == 'm' && other.interested_m? == true
      if other.gender == 'm' && self.interested_m? == true
        return true
      elsif other.gender == 'f' && self.interested_f? == true
        return true
      else
        return false
      end
    elsif self.gender == 'f' && other.interested_f? == true
      if other.gender == 'm' && self.interested_m? == true
        return true
      elsif other.gender == 'f' && self.interested_f? == true
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def priority_event
    interest =Interest.find_by user_id: self.id, interest_rank: 0
    interest.event
  end

end
