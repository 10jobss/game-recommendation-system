game <- read.csv("D:/Data_Set/google_game_all.csv", header=T, stringsAsFactors = FALSE)
w_game <- read.csv("D:/Data_Set/weighted_google_game.csv", header=T, stringsAsFactors = FALSE)

sample_generator <- function() {
  a <- sample(1:1080, 5)
  v <- c(game[a[1],2],game[a[2],2],game[a[3],2],game[a[4],2],game[a[5],2])
  pair <- list("a" = a, "v" = v)
  return(pair)
}

game_recommender <- function(s1, s2, s3, s4, s5) {
  
}