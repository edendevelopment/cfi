require 'spec_helper'

describe 'layouts/application' do
  context 'not signed in' do
    before do
      view.stub!(:user_signed_in? => false)
    end
    it 'does not have a sign out link' do
      render
      rendered.should_not include('sign out')
    end

    it 'has a sign in link' do
      render
      rendered.should include('sign in')
    end
  end

  context 'signed in' do
    before do
      view.stub!(:user_signed_in? => true)
    end
    it 'has a sign out link' do
      render
      rendered.should include('sign out')
    end

    it 'does not have a sign in link' do
      render
      rendered.should_not include('sign in')
    end
  end
end
