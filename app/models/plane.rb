class Plane < ActiveRecord::Base
  include AASM
  INITIAL_STATE = 'ready'
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
    end

    event :fly do
      transitions from: :takeoff, to: :flying
    end
  end



  def empty_runway?
    Plane.where(state: 'takeoff').count.zero?
  end

  def perform_fly
  end

end
