class UsersController < ApplicationController
  def show
    # id = params[:id] # retrieve movie ID from URI route
    # @movie = Movie.find(id) # look up movie by unique ID
    # # will render app/views/movies/show.<extension> by default
  end

  def index
    # @all_ratings = Movie.all_ratings
    # @movies = Movie.with_ratings(ratings_list, sort_by)
    # @ratings_to_show_hash = ratings_hash
    # @sort_by = sort_by
    # # remember the correct settings for next time
    # session['ratings'] = ratings_list
    # session['sort_by'] = @sort_by
  end

  def new
    # default: render 'new' template
  end

  def create
    # @movie = Movie.create!(movie_params)
    # flash[:notice] = "#{@movie.title} was successfully created."
    # redirect_to movies_path
  end

  def edit
    # @movie = Movie.find params[:id]
  end

  def update
    # @movie = Movie.find params[:id]
    # @movie.update_attributes!(movie_params)
    # flash[:notice] = "#{@movie.title} was successfully updated."
    # redirect_to movie_path(@movie)
  end

  def destroy
    # @movie = Movie.find(params[:id])
    # @movie.destroy
    # flash[:notice] = "Movie '#{@movie.title}' deleted."
    # redirect_to movies_path
  end

  def login
  end

  # private
  # def force_index_redirect
  #   if !params.key?(:ratings) || !params.key?(:sort_by)
  #     flash.keep
  #     url = movies_path(sort_by: sort_by, ratings: ratings_hash)
  #     redirect_to url
  #   end
  # end
end
