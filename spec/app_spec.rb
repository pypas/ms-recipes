# frozen_string_literal: true

require 'spec_helper'
require_relative '../app'

Capybara.app = Sinatra::Application

RSpec.describe 'MS Recipes' do
  def app
    Sinatra::Application
  end

  let(:recipe) do
    { 'id' => '437eO3ORCME46i02SeCW46',
      'title' => 'Crispy Chicken and Rice	with Peas & Arugula Salad',
      # rubocop:disable Layout/LineLength
      'image_url' => '//images.ctfassets.net/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg',
      'description' => 'Crispy chicken skin, tender meat, and rich, tomatoey sauce form a winning trifecta of delicious in this one-pot braise. We spoon it over rice and peas to soak up every last drop of goodness, and serve a tangy arugula salad alongside for a vibrant boost of flavor and color. Dinner is served! Cook, relax, and enjoy',
      # rubocop:enable Layout/LineLength
      'tag' => 'gluten free',
      'chef' => 'Jony Chives' }
  end

  describe 'GET /', type: :feature do
    let(:response) { get '/' }
    context 'all recipes' do
      it 'returns status 200 OK' do
        expect(response).to be_ok
      end

      it 'displays title' do
        expect(response.body).to include(recipe['title'])
      end

      it 'displays image' do
        expect(response.body).to include(recipe['image_url'])
      end

      it 'goes to details page when link is clicked' do
        visit '/'
        click_on(recipe['id'])
        expect(page).to have_content recipe['description']
      end
    end
  end

  describe 'GET /:id' do
    let(:response) { get "/#{recipe['id']}" }
    context 'detail recipe' do
      it 'returns status 200 OK' do
        expect(response).to be_ok
      end

      it 'displays title' do
        expect(response.body).to include(recipe['title'])
      end

      it 'displays image' do
        expect(response.body).to include(recipe['image_url'])
      end

      it 'displays description' do
        expect(response.body).to include(recipe['description'])
      end

      it 'displays tag' do
        expect(response.body).to include(recipe['tag'])
      end

      it 'displays chef' do
        expect(response.body).to include(recipe['chef'])
      end
    end
  end
end
