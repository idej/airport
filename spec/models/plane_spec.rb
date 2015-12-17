require 'rails_helper'

RSpec.describe Plane, type: :model do
  context 'aasm states' do
    before do
      @plane = Plane.new
    end

    it 'should have state ready as default' do
      expect(@plane).to have_state(:ready)
    end

    it 'can transition to waiting and takeoff from ready' do
      expect(@plane).to allow_transition_to(:takeoff)
      expect(@plane).to allow_transition_to(:waiting)
      expect(@plane).to_not allow_transition_to(:flying)
    end

    it 'can transition to flying from takeoff' do
      @plane.state = 'takeoff'
      expect(@plane).to allow_transition_to(:flying)
    end
  end

  context 'aasm states callbacks' do
    let(:plane) { Plane.new }
    it 'should call perform fly after start event' do
      expect(plane).to receive(:perform_fly)
      plane.start
    end

    it 'should start other after fly event' do
      plane.state = 'takeoff'
      expect(plane).to receive(:start_other)
      plane.fly
    end
  end
end
