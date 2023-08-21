class GamesController < ApplicationController
  def new
    @letters = (('a'..'z').to_a).shuffle.take(10)
  end
  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)
    word["found"] ? end_game(word, start_time, end_time) : { time: 0, score: 0, message: "not an english word" }
  end
end
