require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do
  before do
    Movie.new(:title => 'A', :director => 'Minh').save
    Movie.new(:title => 'B', :director => 'Minh').save
    Movie.new(:title => 'C', :director => 'Minh3').save
    Movie.new(:title => 'D', :director => '').save
  end
    
  describe 'Search movies by the same director' do
    it 'should call Movie.find_similar_movies' do
      expect(Movie).to receive(:find_similar_movies).with('1')
      get :find_by_director, {:id => 1}
    end
      
    it 'should show similar movies if there are similar director' do
      similar_movies = ['A', 'B']
      expect(Movie.find_similar_movies('1')).to eql(similar_movies)
      get :find_by_director, {:id => 1}
    end
  
    it "should go back to home page if there are no similar director" do
      get :find_by_director, {:id => 4}
      expect(response).to redirect_to(root_url)
    end
  end
  
  describe 'Call index' do
    it 'should highlight title_header' do
      get :index, {sort: 'title'}
      expect(assigns(:title_header)).to eql('bg-warning hilite')
    end

    it 'should highlight release_date header' do
      get :index, {sort: 'release_date'}
      expect(assigns(:date_header)).to eql('bg-warning hilite')
    end
    
    it 'should render the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end