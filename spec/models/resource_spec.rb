require 'spec_helper'

describe Resource do
  let(:resource) { Resource.create(name: "Centre court") }

  subject { resource }

  it { should respond_to(:name) }

  it 'should have a name' do
    expect(resource).to be_valid
  end

  context 'without a name' do
    before { resource.name = " " }

    it 'should not be valid' do
      expect(resource).to_not be_valid
    end
  end
end