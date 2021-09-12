# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'MS Recipes' do
  def app
    Sinatra::Application
  end

  describe 'GET /' do
    let(:response) { get '/' }
    context 'all recipes' do
      it 'returns status 200 OK' do
        expect(response).to be_ok
      end

      it 'displays title' do
        expect(response.body).to include('White Cheddar Grilled Cheese with Cherry Preserves & Basil')
      end

      it 'displays image' do
        # rubocop:disable Layout/LineLength
        expect(response.body).to include('//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg')
        # rubocop:enable Layout/LineLength
      end
    end
  end
end
