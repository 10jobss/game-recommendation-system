game <- read.csv("D:/Data_Set/google_game_all.csv", header=T)
head(game)
game$age_limit <- as.character(game$age_limit)

for(i in 1:1080) {
  game$age_limit[i] <- substr(game$age_limit[i], 1, nchar(game$age_limit[i]) - 1)
}
game$age_limit <- as.numeric(game$age_limit)

str(game)

spt_v <- data.frame(name = game$name)
spt_v <- cbind(spt_v, game$support_version)

b_game <- data.frame(name = game$name)

ggame1 <- data.frame(name = game$name, ±³À° = 0, ´Ü¾î = 0, ·ÑÇÃ·¹À× = 0,
                     º¸µå = 0, ½ºÆ÷Ã÷ = 0, ½Ã¹Ä·¹ÀÌ¼Ç = 0, ¾ÆÄÉÀÌµå = 0,
                     ¾×¼Ç = 0, ¾îµåº¥Ã³ = 0, À½¾Ç = 0, ÀÚµ¿Â÷°æÁÖ = 0,
                     Àü·« = 0, Ä«µå = 0, Ä«Áö³ë = 0, Ä³ÁÖ¾ó°ÔÀÓ = 0,
                     ÄûÁî = 0, ÆÛÁñ = 0)
for(i in 1:1080) {
  if(game[i,6] == "±³À°") { ggame1[i,2] <- 1} else { ggame1[i,2] <-0 }
  if(game[i,6] == "´Ü¾î") { ggame1[i,3] <- 1} else { ggame1[i,3] <-0 }
  if(game[i,6] == "·ÑÇÃ·¹À×") { ggame1[i,4] <- 1} else { ggame1[i,4] <-0 }
  if(game[i,6] == "º¸µå") { ggame1[i,5] <- 1} else { ggame1[i,5] <-0 }
  if(game[i,6] == "½ºÆ÷Ã÷") { ggame1[i,6] <- 1} else { ggame1[i,6] <-0 }
  if(game[i,6] == "½Ã¹Ä·¹ÀÌ¼Ç") { ggame1[i,7] <- 1} else { ggame1[i,7] <-0 }
  if(game[i,6] == "¾ÆÄÉÀÌµå") { ggame1[i,8] <- 1} else { ggame1[i,8] <-0 }
  if(game[i,6] == "¾×¼Ç") { ggame1[i,9] <- 1} else { ggame1[i,9] <-0 }
  if(game[i,6] == "¾îµåº¥Ã³") { ggame1[i,10] <- 1} else { ggame1[i,10] <-0 }
  if(game[i,6] == "À½¾Ç") { ggame1[i,11] <- 1} else { ggame1[i,11] <-0 }
  if(game[i,6] == "ÀÚµ¿Â÷ °æÁÖ") { ggame1[i,12] <- 1} else { ggame1[i,12] <-0 }
  if(game[i,6] == "Àü·«") { ggame1[i,13] <- 1} else { ggame1[i,13] <-0 }
  if(game[i,6] == "Ä«µå") { ggame1[i,14] <- 1} else { ggame1[i,14] <-0 }
  if(game[i,6] == "Ä«Áö³ë") { ggame1[i,15] <- 1} else { ggame1[i,15] <-0 }
  if(game[i,6] == "Ä³ÁÖ¾ó °ÔÀÓ") { ggame1[i,16] <- 1} else { ggame1[i,16] <-0 }
  if(game[i,6] == "ÄûÁî") { ggame1[i,17] <- 1} else { ggame1[i,17] <-0 }
  if(game[i,6] == "ÆÛÁñ") { ggame1[i,18] <- 1} else { ggame1[i,18] <-0 }
}


ggame2 <- data.frame(name = game$name, ³ªÀÌÁ¦ÇÑ_18¼¼ = 0, ³ªÀÌÁ¦ÇÑ_17¼¼ = 0,
                     ³ªÀÌÁ¦ÇÑ_12¼¼ = 0, ³ªÀÌÁ¦ÇÑ_7¼¼ = 0, ³ªÀÌÁ¦ÇÑ_3¼¼ = 0)
for(i in 1:1080) {
  if(game[i,11] == 18) { ggame2[i,2] <- 1} else { ggame2[i,2] <-0 }
  if(game[i,11] == 17) { ggame2[i,3] <- 1} else { ggame2[i,3] <-0 }
  if(game[i,11] == 12) { ggame2[i,4] <- 1} else { ggame2[i,4] <-0 }
  if(game[i,11] == 7) { ggame2[i,5] <- 1} else { ggame2[i,5] <-0 }
  if(game[i,11] == 3) { ggame2[i,6] <- 1} else { ggame2[i,6] <-0 }
}

ggame3 <- data.frame(name = game$name, Æ¯¼º_Æø·Â = 0, Æ¯¼º_°øÆ÷ = 0, Æ¯¼º_¼ºÀû = 0)
for(i in 1:1080) {
  if(is.na(game[i,7])) { next }
  if(game[i,7] == "°¡º­¿î ¿å¼³" || game[i,7] == "°¡º­¿î Æø·Â" || 
     game[i,7] == "°¡º­¿î Æø·Â, °øÆ÷°¨" || game[i,7] == "°­·ÂÇÑ Æø·Â" ||
     game[i,7] == "±Ø½ÉÇÑ Æø·Â" || game[i,7] == "±Ø½ÉÇÑ Æø·Â, ³ëÃâ, ¼ºÇàÀ§" ||
     game[i,7] == "±Ø½ÉÇÑ Æø·Â, Æø¾ð" || game[i,7] == "º¸Åë¼öÁØÀÇ Æø·Â" || 
     game[i,7] == "º¸Åë¼öÁØÀÇ Æø·Â, °¡º­¿î ¿å¼³" || game[i,7] == "º¸Åë¼öÁØÀÇ Æø·Â, °øÆ÷" ||
     game[i,7] == "º¸Åë¼öÁØÀÇ Æø·Â, °øÆ÷, °¡º­¿î ¿å¼³" || game[i,7] == "º¸Åë¼öÁØÀÇ Æø·Â, ¼ºÀûÀÎ ³ó´ã" || 
     game[i,7] == "º¸Åë ¼öÁØÀÇ Æø·Â, ¼ºÀûÀÎ ³ó´ã, °¡º­¿î ¿å¼³" || game[i,7] == "º¸Åë ¼öÁØÀÇ Æø·Â, ¼ºÀûÀÎ ³ó´ã, °øÆ÷" || 
     game[i,7] == "¼ºÀûÀÎ ³ó´ã, °¡º­¿î ¿å¼³" || game[i,7] == "¼ºÀûÀÎ ³ó´ã, °øÆ÷, °¡º­¿î ¿å¼³" ||
     game[i,7] == "Æø·Â ¾Ï½Ã" || game[i,7] == "Æø·Â ¾Ï½Ã, °¡º­¿î Æø·Â" || 
     game[i,7] == "Æø·Â ¾Ï½Ã, °¡º­¿î Æø·Â, °øÆ÷°¨" || game[i,7] == "Æø·Â ¾Ï½Ã, °øÆ÷°¨" || 
     game[i,7] == "Æø¾ð") {
    ggame3[i,2] <- 1} else { ggame3[i,2] <-0 }
  
  if(game[i,7] == "°¡º­¿î Æø·Â, °øÆ÷°¨" || game[i,7] == "°øÆ÷" || 
     game[i,7] == "°øÆ÷°¨" || game[i,7] == "°øÆ÷°¨, °¡º­¿î Æø·Â" || 
     game[i,7] == "º¸Åë¼öÁØÀÇ Æø·Â, °øÆ÷" || game[i,7] == "º¸Åë¼öÁØÀÇ Æø·Â, ¼ºÀûÀÎ ³ó´ã, °øÆ÷" || 
     game[i,7] == "¼ºÀûÀÎ ³ó´ã, °øÆ÷, °¡º­¿î ¿å¼³" || game[i,7] == "Æø·Â ¾Ï½Ã, °¡º­¿î Æø·Â, °øÆ÷°¨" ||
     game[i,7] == "Æø·Â ¾Ï½Ã, °øÆ÷°¨") { 
    ggame3[i,3] <- 1} else { ggame3[i,3] <-0 }
  
  if(game[i,7] == "±Ø½ÉÇÑ Æø·Â, ³ëÃâ, ¼ºÇàÀ§" || game[i,7] == "³ëÃâ" || 
     game[i,7] == "º¸Åë¼öÁØÀÇ Æø·Â, ¼ºÀûÀÌ ³ó´ã" || game[i,7] == "º¸Åë ¼öÁØÀÇ Æø·Â, ¼ºÀûÀÎ ³ó´ã, °¡º­¿î ¿å¼³" || 
     game[i,7] == "º¸Åë ¼öÁØÀÇ Æø·Â, ¼ºÀûÀÎ ³ó´ã, °øÆ÷" || game[i,7] == "¼ºÀûÀÎ ³ó´ã" || 
     game[i,7] == "¼ºÀûÀÎ ³ó´ã, °¡º­¿î ¿å¼³" || game[i,7] == "¼ºÀûÀÎ ³ó´ã, °øÆ÷, °¡º­¿î ¿å¼³" || 
     game[i,7] == "¼ºÇàÀ§") { 
    ggame3[i,4] <- 1} else { ggame3[i,4] <-0 }
}

b_game <- cbind(b_game, ggame1[,2:18], ggame2[,2:6], ggame3[,2:4], game$paid)

write.csv(b_game, file = "binary_google_game.csv")

###################################### DF - IDF ######################################################

binary_game <- read.csv("D:/Data_Set/binary_google_game.csv", header=T)
head(binary_game)

for(i in 3:28) {
  tmp <- 0
  for(j in 1:1080) {
    if(binary_game[j,i] == 1) {
      tmp <- tmp + binary_game[j, i]
    }
  }
  for(j in 1:1080) {
    if(binary_game[j,i] == 1) {
      binary_game[j, i] <- log(1080/tmp, base = 10)
    }
  }
}

write.csv(binary_game, file = "weighted_google_game.csv")
