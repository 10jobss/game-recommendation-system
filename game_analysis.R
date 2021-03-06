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

ggame1 <- data.frame(name = game$name, ���� = 0, �ܾ� = 0, ���÷��� = 0,
                     ���� = 0, ������ = 0, �ùķ��̼� = 0, �����̵� = 0,
                     �׼� = 0, ��庥ó = 0, ���� = 0, �ڵ������� = 0,
                     ���� = 0, ī�� = 0, ī���� = 0, ĳ�־���� = 0,
                     ���� = 0, ���� = 0)
for(i in 1:1080) {
  if(game[i,6] == "����") { ggame1[i,2] <- 1} else { ggame1[i,2] <-0 }
  if(game[i,6] == "�ܾ�") { ggame1[i,3] <- 1} else { ggame1[i,3] <-0 }
  if(game[i,6] == "���÷���") { ggame1[i,4] <- 1} else { ggame1[i,4] <-0 }
  if(game[i,6] == "����") { ggame1[i,5] <- 1} else { ggame1[i,5] <-0 }
  if(game[i,6] == "������") { ggame1[i,6] <- 1} else { ggame1[i,6] <-0 }
  if(game[i,6] == "�ùķ��̼�") { ggame1[i,7] <- 1} else { ggame1[i,7] <-0 }
  if(game[i,6] == "�����̵�") { ggame1[i,8] <- 1} else { ggame1[i,8] <-0 }
  if(game[i,6] == "�׼�") { ggame1[i,9] <- 1} else { ggame1[i,9] <-0 }
  if(game[i,6] == "��庥ó") { ggame1[i,10] <- 1} else { ggame1[i,10] <-0 }
  if(game[i,6] == "����") { ggame1[i,11] <- 1} else { ggame1[i,11] <-0 }
  if(game[i,6] == "�ڵ��� ����") { ggame1[i,12] <- 1} else { ggame1[i,12] <-0 }
  if(game[i,6] == "����") { ggame1[i,13] <- 1} else { ggame1[i,13] <-0 }
  if(game[i,6] == "ī��") { ggame1[i,14] <- 1} else { ggame1[i,14] <-0 }
  if(game[i,6] == "ī����") { ggame1[i,15] <- 1} else { ggame1[i,15] <-0 }
  if(game[i,6] == "ĳ�־� ����") { ggame1[i,16] <- 1} else { ggame1[i,16] <-0 }
  if(game[i,6] == "����") { ggame1[i,17] <- 1} else { ggame1[i,17] <-0 }
  if(game[i,6] == "����") { ggame1[i,18] <- 1} else { ggame1[i,18] <-0 }
}


ggame2 <- data.frame(name = game$name, ��������_18�� = 0, ��������_17�� = 0,
                     ��������_12�� = 0, ��������_7�� = 0, ��������_3�� = 0)
for(i in 1:1080) {
  if(game[i,11] == 18) { ggame2[i,2] <- 1} else { ggame2[i,2] <-0 }
  if(game[i,11] == 17) { ggame2[i,3] <- 1} else { ggame2[i,3] <-0 }
  if(game[i,11] == 12) { ggame2[i,4] <- 1} else { ggame2[i,4] <-0 }
  if(game[i,11] == 7) { ggame2[i,5] <- 1} else { ggame2[i,5] <-0 }
  if(game[i,11] == 3) { ggame2[i,6] <- 1} else { ggame2[i,6] <-0 }
}

ggame3 <- data.frame(name = game$name, Ư��_���� = 0, Ư��_���� = 0, Ư��_���� = 0)
for(i in 1:1080) {
  if(is.na(game[i,7])) { next }
  if(game[i,7] == "������ �弳" || game[i,7] == "������ ����" || 
     game[i,7] == "������ ����, ������" || game[i,7] == "������ ����" ||
     game[i,7] == "�ؽ��� ����" || game[i,7] == "�ؽ��� ����, ����, ������" ||
     game[i,7] == "�ؽ��� ����, ����" || game[i,7] == "��������� ����" || 
     game[i,7] == "��������� ����, ������ �弳" || game[i,7] == "��������� ����, ����" ||
     game[i,7] == "��������� ����, ����, ������ �弳" || game[i,7] == "��������� ����, ������ ���" || 
     game[i,7] == "���� ������ ����, ������ ���, ������ �弳" || game[i,7] == "���� ������ ����, ������ ���, ����" || 
     game[i,7] == "������ ���, ������ �弳" || game[i,7] == "������ ���, ����, ������ �弳" ||
     game[i,7] == "���� �Ͻ�" || game[i,7] == "���� �Ͻ�, ������ ����" || 
     game[i,7] == "���� �Ͻ�, ������ ����, ������" || game[i,7] == "���� �Ͻ�, ������" || 
     game[i,7] == "����") {
    ggame3[i,2] <- 1} else { ggame3[i,2] <-0 }
  
  if(game[i,7] == "������ ����, ������" || game[i,7] == "����" || 
     game[i,7] == "������" || game[i,7] == "������, ������ ����" || 
     game[i,7] == "��������� ����, ����" || game[i,7] == "��������� ����, ������ ���, ����" || 
     game[i,7] == "������ ���, ����, ������ �弳" || game[i,7] == "���� �Ͻ�, ������ ����, ������" ||
     game[i,7] == "���� �Ͻ�, ������") { 
    ggame3[i,3] <- 1} else { ggame3[i,3] <-0 }
  
  if(game[i,7] == "�ؽ��� ����, ����, ������" || game[i,7] == "����" || 
     game[i,7] == "��������� ����, ������ ���" || game[i,7] == "���� ������ ����, ������ ���, ������ �弳" || 
     game[i,7] == "���� ������ ����, ������ ���, ����" || game[i,7] == "������ ���" || 
     game[i,7] == "������ ���, ������ �弳" || game[i,7] == "������ ���, ����, ������ �弳" || 
     game[i,7] == "������") { 
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
###################################### Recommend ######################################################
w_game <- read.csv("D:/Data_Set/weighted_google_game.csv", header=T)
head(w_game)
w_game <- w_game[,-1]
w_game <- w_game[,-1]
