require 'rails_helper'

describe MoviesController do
  describe 'Search movies by the same director' do
    it 'should call Movie.find_similar_movies' do
      expect(Movie).to receive(:find_similar_movies).with(1)
      get :find_by_director, {:id => 1}
    end
  end
end