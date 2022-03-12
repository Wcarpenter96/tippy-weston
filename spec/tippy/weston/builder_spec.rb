require 'spec_helper'

RSpec.describe Tippy::Weston::Builder do
    describe '#generate' do
        it 'Accurately generates a tip given a string or integer input' do
            new_amount = Tippy::Weston::Builder.new(total: 100, gratuity: 20).generate
            expect(new_amount).to eq(120.0)
        end
    end
end