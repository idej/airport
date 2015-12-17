require 'rails_helper'

RSpec.describe Plane, type: :model do
  describe 'aasm' do
    let(:plane) { Plane.new }

    context 'states' do
      it 'should have state ready as default' do
        expect(plane).to have_state(:ready)
      end

      it 'can transition to waiting and takeoff from ready' do
        expect(plane).to allow_transition_to(:takeoff)
        expect(plane).to allow_transition_to(:waiting)
        expect(plane).to_not allow_transition_to(:flying)
      end

      it 'can transition to flying from takeoff' do
        plane.state = 'takeoff'
        expect(plane).to allow_transition_to(:flying)
      end
    end

    context 'states callbacks' do
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

  describe '#empty_runaway?' do
    it 'should return false if exist takeoff plane' do
      Plane.create(state: 'takeoff')
      expect(Plane.new.empty_runway?).to be_falsey
    end

    it 'should return true if no takeoff plane' do
      expect(Plane.new.empty_runway?).to be_truthy
    end
  end

  describe '#states_history' do
    let(:plane) { Plane.create }

    it 'should return initial state for new object' do
      expect(plane.states_history).to eq([Plane::INITIAL_STATE])
    end

    it 'should return ready, takeoff and flying states' do
      allow(plane).to receive(:perform_fly).and_return(true)
      plane.start!
      plane.fly!
      expect(plane.states_history).to eq(["ready", "takeoff", "flying"])
    end
  end
end
