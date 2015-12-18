require 'rails_helper'

describe Ship do
  describe 'validates ship coordinates are within board' do
    context 'coordinate outside board' do
      let!(:invalid_ship) { build(:ship, :invalid_coordinate) }

      it 'does not save' do
        expect{
          invalid_ship.save
        }.to change(Ship, :count).by 0
      end

      it 'sets a validation error on the object' do
        invalid_ship.save
        expect(invalid_ship.errors).not_to be_empty
      end
    end

    context 'coordinate within board' do
      let(:ship) { build(:ship) }

      it 'saves' do
        expect {
          ship.save
        }.to change(Ship, :count).by 1
      end
    end
  end
end
