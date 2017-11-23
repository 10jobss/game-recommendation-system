# source("ui.R") # node stack overflow error
game <- read.csv("D:/Data_Set/google_game_all.csv", header=T, stringsAsFactors = FALSE)
w_game <- read.csv("D:/Data_Set/weighted_google_game.csv", header=T, stringsAsFactors = FALSE)
g_sim <- c(numeric(1080))
g_sim <- as.double(g_sim)
g_top_list <- cbind(game[,2],game[,4:6], game[,9], game[,11:12], g_sim)
colnames(g_top_list)[1] <- "title"
colnames(g_top_list)[5] <- "rating_score"

sample_generator <- function() {
  a <- sample(1:1080, 5) # index (not rank)
  v <- c(game[a[1],2],game[a[2],2],game[a[3],2],game[a[4],2],game[a[5],2]) # title
  pair <- list("a" = a, "v" = v)
  return(pair)
}

game_recommender <- function(s1, s2, s3, s4, s5) {
  w1 = as.numeric(s1)
  w2 = as.numeric(s2)
  w3 = as.numeric(s3)
  w4 = as.numeric(s4)
  w5 = as.numeric(s5)
  
  # k[n] is vector of game[n]
  # if 'like' vector would be k[n], or 'dislike' vector would be -k[n]
  if(w1 > 0) { k1 = w_game[w1,] }
  else {
    w1 = -w1
    k1 = -w_game[w1,]
  }

  if(w2 > 0) { k2 = w_game[w2,] }
  else {
    w2 = -w2
    k2 = -w_game[w2,]
  }
  if(w3 > 0) { k3 = w_game[w3,] }
  else {
    w3 = -w3
    k3 = -w_game[w3,]
  }

  if(w4 > 0) { k4 = w_game[w4,] }
  else {
    w4 = -w4
    k4 = -w_game[w4,]
  }

  if(w5 > 0) { k5 = w_game[w5,] }
  else {
    w5 = -w5
    k5 = -w_game[w5,]
  }
  
  
  k1 = as.vector(k1)
  k2 = as.vector(k2)
  k3 = as.vector(k3)
  k4 = as.vector(k4)
  k5 = as.vector(k5)
  uv <- k1 + k2 + k3 + k4 + k5 # user vector
  
  # calculate cosine similarity between user vector(uv) and item vector(iv)
  # except sample item
  for(i in 1:1080) {
    if(i == w1 || i == w2 || i == w3 || i == w4 || i == w5) { next }
    tmp_item_vec = as.vector(w_game[i,])
    molec <- sum(uv*tmp_item_vec) # molecule (the inner product of uv, iv)
    denom <- sqrt(sum(uv^2)) * sqrt(sum(tmp_item_vec^2)) # denominator (size of uv, iv)
    if(molec < 0) {
      g_top_list$g_sim[i] = -(abs(molec) / denom)
    } else {
      g_top_list$g_sim[i] = (abs(molec) / denom)
    }
  }
  g_top_list <- g_top_list[order(-g_top_list$g_sim),]
  rec_list <- g_top_list[1:50,]
  return(rec_list)
}