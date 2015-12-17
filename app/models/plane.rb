class Plane < ActiveRecord::Base
  include AASM
  INITIAL_STATE = 'ready'
  after_destroy :start_other
  after_update :publish_status, if: :state_changed?

  aasm column: :state do
    state :ready, :initial => true
    state :waiting
    state :takeoff
    state :flying

    event :wait do
      transitions to: :waiting
    end

    event :start, after: :perform_fly do
      transitions from: [:ready, :waiting], to: :takeoff, guard: :empty_runway?
      error do |e|
        wait!
      end
    end

    event :fly do
      transitions from: :takeoff, to: :flying
      after do
        start_other
      end
    end
  end


  def start_other
    Plane.transaction do
      if plane = Plane.find_by(state: 'waiting')
        plane.start!
      end
    end
  end

  def empty_runway?
    Plane.where(state: 'takeoff').count.zero?
  end

  def perform_fly
    EventJob.set(wait: 10.seconds).perform_later(self, 'fly')
  end

end
