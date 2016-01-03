require 'rails_helper'

describe PlayerBoard do
  it 'creates cells after_create' do
    expect{
      create(:human_board)
    }.to change(Cell, :count).by 25
  end
end
