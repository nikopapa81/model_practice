class QuestionsController < ApplicationController
  def question_1
    # What is the most recent movie on the list that the second actor appeared in?

    # Your Ruby goes here.
      @most_recent_movie_for_second_actor = Actor.second.movies.order("year").last

    # @most_recent_movie_for_second_actor = ???
  end

  def question_2
    # Who directed the longest movie on the list?

    # Your Ruby goes here.
      @director_of_longest_movie = Movie.order("duration").last.director

    # @director_of_longest_movie = ???
  end

  def question_3
    # Which director has the most movies on the list?

    # Your Ruby goes here.
    the_leader = Director.new

     Director.all.each do |the_director|
       if the_director.movies.count > the_leader.movies.count
         the_leader = the_director
       end
     end

     @director_with_the_most_movies = the_leader

    # @director_with_the_most_movies = ???
  end

  def question_4
    # Which actor has been in the most movies on the list?
    # (If there's a tie, any one of them is fine)

    # Your Ruby goes here.
    the_leader = Actor.new

     Actor.all.each do |the_actor|
       if the_actor.movies.count > the_leader.movies.count
         the_leader = the_actor
       end
     end

     @actor_with_the_most_movies = the_leader

  end

  def question_5
    # This one is hard. Work on it after all your other review is complete.

    most_movies_together = 0
     @actor = nil
     @director = nil

     Actor.all.each do |actor|
       this_actors_most_movies_with_one_director = 0
       this_actors_favorite_director = nil

       actor.movies.each do |movie|
         number_of_movies_with_same_director_as_this_one = actor.movies.where(:director_id => movie.director_id).count

         if this_actors_most_movies_with_one_director < number_of_movies_with_same_director_as_this_one
           this_actors_most_movies_with_one_director = number_of_movies_with_same_director_as_this_one
           this_actors_favorite_director = movie.director
         end
       end

       if most_movies_together < this_actors_most_movies_with_one_director
         most_movies_together = this_actors_most_movies_with_one_director
         @director = this_actors_favorite_director
         @actor = actor
       end
     end

     @movies_together = @actor.movies.where(:director_id => @director.id)
  end
end
