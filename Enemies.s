.data
Q:		.space 3	
QUEUE_ENEMIES:	.space 2804		#Espa�o para 40 enemies -> 20(espa�o ocupado por cada um) x 40 = 640

GHOST_SIZE:	.half 23, 23

ZOMBIE_SIZE:	.half 30, 46

KNIGHT_SIZE:	.half 50, 80

SHOCKWAVE_SIZE:	.half 15, 48

THORNS_SIZE:	.half 33, 33

SLIME_SIZE:	.half 66, 50

BONES_SIZE:	.half 23, 47

MORTE_SIZE:	.half 89, 97

ORB_SIZE:	.half 36, 36

Lamar_size:		.half 27, 38
Death_enemy_size:	.half 32, 32
Heart_size:		.half 17, 17	
Calice_size: 		.half 11, 10	
Ritcher_damaged: 	.byte 0	#(se estiver ferido = 1, caso contrario, 0.)
Ritcher_IMUNITY:	.byte 0

#Determina se o calice foi pego(0 = ja foi pego n existe mais, 1 = ainda n foi pego)
Calice1:		.byte   1
Calice2:		.byte	1
Calice3:		.byte	1

.text
.eqv IMUNITY_TIME		15	#15 loops na main	

.eqv GHOST_VELOCITY		1
.eqv GHOST_HP			1

.eqv ZOMBIE_VELOCITY		1
.eqv ZOMBIE_HP			20

.eqv KNIGHT_VELOCITY		1
.eqv KNIGHT_HP			50
.eqv SHOCKWAVE_VELOCITY		3

.eqv SLIME_HP			25

.eqv BONES_HP			20

.eqv MORTE_HP			100

.eqv ORB_HP			1
###################### ADD_GHOST ###############################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_GHOST:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
sw zero, 0(t0)		#Stance primario ghost = 0
addi t0, t0, 4		#Proxima posicao
li t1, GHOST_HP
sw t1, 0(t0)		#Vida ghost = 1
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret


###################### ADD_ZOMBIE ###############################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_ZOMBIE:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t1, 39
sw t1, 0(t0)		#Stance primario = 39
addi t0, t0, 4		#Proxima posicao
li t1, ZOMBIE_HP
sw t1, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret


###################### ADD_KIGHT ###############################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_KNIGHT:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t1, 73
sw t1, 0(t0)		#Stance primario = 73
addi t0, t0, 4		#Proxima posicao
li t1, KNIGHT_HP
sw t1, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret




###################### ADD_SHOCKWAVE ############################
#	ARGUMENTOS:						#
#		s6 = posicao x					#
#		s7 = posicao y					#
#		s8 = dire�ao do ataque				#
#								#
#################################################################
ADD_SHOCKWAVE:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t3, 201
sw t3, 0(t0)		#Stance primario = 201
addi t0, t0, 4		#Proxima posicao
li t3, 10
sw t3, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
sw s8, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw s6, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw s7, 0(t0)		#Armazena posicao y
addi s10, s10, 20
j ENEMY_NEXT



###################### ADD_THORN ################################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_THORN:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t1, 202
sw t1, 0(t0)		#Stance primario = 202
addi t0, t0, 4		#Proxima posicao
li t1, 1000		# "Imortal"
sw t1, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret



###################### ADD_SLIME ################################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_SLIME:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t1, 203
sw t1, 0(t0)		#Stance primario = 203
addi t0, t0, 4		#Proxima posicao
li t1, SLIME_HP			
sw t1, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret

###################### ADD_BONES ###############################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_BONES:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t1, 204
sw t1, 0(t0)		#Stance primario = 204
addi t0, t0, 4		#Proxima posicao
li t1, BONES_HP
sw t1, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
addi t1, a1, -150	#Espa�o de trajeto, patrulha pixels pra esquerda e dps volta em loop
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret

###################### ADD_MORTE ###############################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_MORTE:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t1, 235
sw t1, 0(t0)		#Stance primario = 236
addi t0, t0, 4		#Proxima posicao
li t1, MORTE_HP
sw t1, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
#addi t1, a1, -150	#Espa�o de trajeto, patrulha pixels pra esquerda e dps volta em loop
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret

###################### ADD_ORB ###############################
#	ARGUMENTOS:						#
#		s8 = posicao x					#
#		s9 = posicao y					#
#								#
#								#
#################################################################
ADD_ORB:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t3, 376
sw t3, 0(t0)		#Stance primario = 376
addi t0, t0, 4		#Proxima posicao
li t3, ORB_HP
sw t3, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
sw s8, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw s8, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw s9, 0(t0)		#Armazena posicao y
addi s10, s10, 20
jr s6			#Retorna para s6

###################### ADD_CALICE ###############################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_CALICE:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t1, -74
sw t1, 0(t0)		#Stance primario = 235
addi t0, t0, 4		#Proxima posicao
li t1, 1000		#Imortal
sw t1, 0(t0)		#Vida
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret

###################### ADD_LAMARZINHO ###############################
#	ARGUMENTOS:						#
#		a1 = posicao x					#
#		a2 = posicao y					#
#								#
#								#
#################################################################
ADD_LAMARZINHO:
la t0, QUEUE_ENEMIES 
add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue, para colocar proximo enemy no final da queue
addi t0, t0, 4		#Proxima posicao
li t1, -75
sw t1, 0(t0)		#Stance primario ghost = 0
addi t0, t0, 4		#Proxima posicao
li t1, 1000
sw t1, 0(t0)		#Vida ghost = 1000
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x fixa para movimenta��o
addi t0, t0, 4		#Proxima posicao
sw a1, 0(t0)		#Armazena posicao x
addi t0, t0, 4		#Proxima posicao
sw a2, 0(t0)		#Armazena posicao y
addi s10, s10, 20
ret

###################### ENEMIES ##################################
#	RESULTADO:						#
#		a1 = posicao x	no bitmap			#
#		a2 = posicao y	no bitmap			#
#		a6 = posicao x	no mapa de enemies		#
#		a7 = posicao y	no mapa de enemies		#
#								#
#################################################################
#Determina a1, a2, a6, a7 para print do inimigo
ENEMIES:	la t0, QUEUE_ENEMIES 
		add t0, t0, s10		#soma posicao s10 como a ultima posicao da queue
		#Posicao y
		lw t1, 0(t0)		#carrega y
		#Posicao x
		addi t0, t0, -4		#Proxima posicao
		lw t2, 0(t0)		#carrega x
		#Posicao fixa de x
		addi t0, t0, -4		#Proxima posicao
		lw s7, 0(t0)		#carrega x
		#Vida enemy
		addi t0, t0, -4		#Proxima posicao
		lw s5, 0(t0)		#carrega vida
		#Stance do enemy
		addi t0, t0, -4		#Proxima posicao
		lw t5, 0(t0)		#carrega stance
		addi t0, t0, -4		#Proxima posicao
		addi s10, s10, -20	

		
		#------------------------------Se esta dentro da tela do jogador-----------------------------------------------------
		#posicao mapa x(s3) <= enemy x(t2) and s3 + screen width >= t2 + enemy_width
		blt t2, s3, NOT_IN_SCREEN
		addi t3, s3, SCREEN_WIDTH #t3 = s3 + screen width
		addi t4, t2, 25
		blt t3, t4, NOT_IN_SCREEN
		#posicao mapa y(s4) <= enemy y(t1) and s4 + screen height >= t1 + enemy height
		blt t1, s4, NOT_IN_SCREEN
		addi t3, s4, SCREEN_WIDTH #t3 = s4 + screen height
		addi t4, t1, 25
		blt t3, t4, NOT_IN_SCREEN
		
		#Calcular posicao no mapa
		#enemy x(t2) - posicao mapa x(s3)  
		sub a1, t2, s3
		#enemy y(t1) - posicao mapa y(s4)  
		sub a2, t1, s4
		
		
		#------------------------------Se esta dentro do hitbox de ataque-----------------------------------------------------
		#Determina altura do inimigo	
		
		
		li t0, 38
		bge t0, t5, GHOST_HEIGHT
		
		li t0, 72
		bge t0, t5, ZOMBIE_HEIGHT
		
		li t0, 179
		bge t0, t5, KNIGHT_HEIGHT
		
		li t0, 202
		bge t0, t5, THORNS_HEIGHT	
		
		li t0, 203
		bge t0, t5, SLIME_HEIGHT
		
		li t0, 204
		bge t0, t5, BONES_HEIGHT
		
		li t0, 375
		bge t0, t5, MORTE_HEIGHT
		
		li t0, -72
		bge t5, t0, DEATH_HEIGHT
		
		li t0, -73
		bge t5, t0, HEART_HEIGHT
		
		
		GHOST_HEIGHT:
		la t0, GHOST_SIZE
		lh t4, 2(t0)
		j START_HITBOX_ENEMY 
		
		ZOMBIE_HEIGHT:
		la t0, ZOMBIE_SIZE
		lh t4, 2(t0)
		j START_HITBOX_ENEMY 
		
		KNIGHT_HEIGHT:
		la t0, KNIGHT_SIZE
		lh t4, 2(t0)
		j START_HITBOX_ENEMY 
		
		DEATH_HEIGHT:
		la t0, Death_enemy_size
		lh t4, 2(t0)
		j START_HITBOX_ENEMY 
		
		HEART_HEIGHT:
		la t0, Heart_size
		lh t4, 2(t0)
		j START_HITBOX_ENEMY 
		
		THORNS_HEIGHT:
		la t0, THORNS_SIZE
		lh t4, 0(t0)
		j START_HITBOX_ENEMY 
		
		SLIME_HEIGHT:
		la t0, SLIME_SIZE
		lh t4, 0(t0)
		j START_HITBOX_ENEMY 
		
		BONES_HEIGHT:
		la t0, BONES_SIZE
		lh t4, 0(t0)
		j START_HITBOX_ENEMY 
		
		MORTE_HEIGHT:
		la t0, MORTE_SIZE
		lh t4, 0(t0)
		j START_HITBOX_ENEMY 
		#-----------------------------------------------------------------------
		START_HITBOX_ENEMY :	
		la	t0, PLAYER_POS
		lw 	t3, 0(t0)			
		bge 	t2, t3, DIR_HITBOX	#Esta a esquerda
		#Enemy pela esquerda
		la 	t0, Whip_HITBOX
		lh 	t3, 0(t0)
		sub 	s6, t2, s3
		ble 	s6, t3, HITBOX_SHURIKEN	#se pos_whip x > enemy x, not in
		lh 	t3, 2(t0)
		sub 	s6, t1, s4
		ble 	t3, s6, HITBOX_SHURIKEN	#se pos_whip y < enemy y, not in
		add 	s6, s6, t4
		
		ble 	s6, t3, HITBOX_SHURIKEN		#se pos_whip y  > enemy y + Height_enemy, not in
		
		j DAMAGE_ENEMY
		
		DIR_HITBOX:
		#Ghost peladireita
		la 	t0, Whip_HITBOX
		lh 	t3, 0(t0)
		sub 	s6, t2, s3
		ble 	t3, s6, HITBOX_SHURIKEN		#se pos_whip x < enemy x, not in
		lh 	t3, 2(t0)
		sub 	s6, t1, s4
		ble 	t3, s6, HITBOX_SHURIKEN		#se pos_whip y < enemy y, not in
		add 	s6, s6, t4
		
		
		ble 	s6, t3, HITBOX_SHURIKEN		#se pos_whip y  > enemy y + Height_enemy, not in
		j DAMAGE_ENEMY

		#-----------------------------------------------------------------------		
		HITBOX_SHURIKEN:
		la 	t0, SHURIKEN_POWER
		lb	t3, 0(t0)
		beqz	t3, DAMAGE_BY_ENEMY
		la	t0, Shuriken_HITBOX
		lw 	t3, 0(t0)			
		bge 	t2, t3, DIR_HITBOX2	#Esta a esquerda
		
		#Enemy pela esquerda
		la 	t0, Shuriken_HITBOX
		lw 	t3, 0(t0)
		ble 	t3, t2, DAMAGE_BY_ENEMY		#se pos_whip x > enemy x, not in
		addi 	s6, t2, 30
		ble 	s6, t3, DAMAGE_BY_ENEMY		#se pos_whip x > enemy x, not in
		
		lw	t3, 4(t0)
		addi 	t3, t3, 8			#Para pos shuriken ser o meio do shuriken
		ble 	t3, t1, DAMAGE_BY_ENEMY		#se pos_whip y < enemy y, not in
		add 	s6, t1, t4
		
		ble 	s6, t3, DAMAGE_BY_ENEMY		#se pos_whip y  > enemy y + Height_enemy, not in
		j DAMAGE_ENEMY
		
		DIR_HITBOX2:
		#Ghost peladireita
		la 	t0, Shuriken_HITBOX
		lw	t3, 0(t0)
		ble 	t2, t3, DAMAGE_BY_ENEMY		#se pos_whip x > enemy x, not in
		addi 	s6, t2, -30
		ble 	t3, s6, DAMAGE_BY_ENEMY		#se pos_whip x > enemy x, not in
		
		ble 	t2, t3, DAMAGE_BY_ENEMY		#se pos_whip x > enemy x, not in
		
		lw	t3, 4(t0)
		addi 	t3, t3, 8			#Para pos shuriken ser o meio do shuriken		
		ble 	t3, t1, DAMAGE_BY_ENEMY		#se pos_whip y < enemy y, not in
		add 	s6, t1, t4
		
		ble 	s6, t3, DAMAGE_BY_ENEMY			#se pos_whip y  > enemy y + Height_enemy, not in
		j DAMAGE_ENEMY
		#-----------------------------------------------------------------------
		
						
		NOT_IN_SCREEN:
		li a1, -1
		j DAMAGE_BY_ENEMY
		
		
		DAMAGE_ENEMY:
		li t0, -73
		beq t0, t5, DAMAGE_BY_ENEMY
		li t0, -1
		bge t0, t5, DEATH_ENEMY
		#Damage
		addi s5, s5, -1
		beqz s5, ENEMY_DEAD
		
		#Se for a morte, ao receber dano ativa sua mecanica de se movimentar
		li t0, 236
		bge t5, t0, MORTE_DAMAGED		#Se t5 >= 236, necesasriamente siginifica que esta � a morte
		j END_MORTE_DAMAGED	
			MORTE_DAMAGED:
			bne t2, s7, END_MORTE_DAMAGED	#Ainda esta em movimento
			la t0, PLAYER_POS
			lw t3, 0(t0)
			bge t2, t3, MORTE_NEW_POS_DIR		#Se t3 maior que t2, MORTE vai para a direita
				#Para esquerda
				addi s7, t2, 320
				j    END_MORTE_DAMAGED		
										
				MORTE_NEW_POS_DIR:	
				#Para direita
				addi s7, t2, -320
			
				END_MORTE_DAMAGED:
						
						
		la	t0, PLAYER_POS
		lw 	t3, 0(t0)			
		bge 	t2, t3, DIR_HITBOX_IMPULSION	#Esta a esquerda
		addi 	t2, t2, -3
		j DAMAGE_BY_ENEMY
		DIR_HITBOX_IMPULSION:
		addi 	t2, t2, 3
		
		j DAMAGE_BY_ENEMY
		
		ENEMY_DEAD:
		bge t5, zero, DEATH_INIT
		j DEATH_ENEMY
		
		
DAMAGE_BY_ENEMY:
	li t0, -73
	beq t0, t5, HEART_HEIGHT2
	li t0, -1
	#bge t0, t5, DEATH_ENEMY
	#Determina altura do inimigo para t4
	la t0, Ritcher_damaged
	lb t4, 0(t0)
	bne t4, zero, STANCE_ENEMY	#Se damaged, fica invulneravel 	
		
		li t0, -73
		beq t0, t5, HEART_HEIGHT2
		
		li t0, 38
		bge t0, t5, GHOST_HEIGHT2
		
		li t0, 72
		bge t0, t5, ZOMBIE_HEIGHT2	
		
		li t0, 179
		bge t0, t5, KNIGHT_HEIGHT2	
		
		li t0, 202
		bge t0, t5, THORNS_HEIGHT2	
		
		li t0, 203
		bge t0, t5, SLIME_HEIGHT2			
		
		li t0, 204
		bge t0, t5, BONES_HEIGHT2									
		
		li t0, 375
		bge t0, t5, MORTE_HEIGHT2
																																																																																																														
		GHOST_HEIGHT2:
		la t0, GHOST_SIZE
		lh t4, 2(t0)
		j DAMAGE_BY_ENEMY_INIT
		
		ZOMBIE_HEIGHT2:
		la t0, ZOMBIE_SIZE
		lh t4, 2(t0)
		j DAMAGE_BY_ENEMY_INIT	
		
		
		KNIGHT_HEIGHT2:
		la t0, KNIGHT_SIZE
		lh t4, 2(t0)
		j DAMAGE_BY_ENEMY_INIT	
		
		HEART_HEIGHT2:
		la t0, Heart_size
		lh t4, 2(t0)
		j DAMAGE_BY_ENEMY_INIT	
		
		SLIME_HEIGHT2:
		la t0, SLIME_SIZE
		lh t4, 0(t0)
		j DAMAGE_BY_ENEMY_INIT
		
		THORNS_HEIGHT2:
		la t0, THORNS_SIZE
		lh t4, 0(t0)
		j DAMAGE_BY_ENEMY_INIT						
		
		BONES_HEIGHT2:
		la t0, BONES_SIZE
		lh t4, 0(t0)
		j DAMAGE_BY_ENEMY_INIT																									
		
		MORTE_HEIGHT2:
		j STANCE_ENEMY	#A morte n causa dano fisico ao player
								
																																															
DAMAGE_BY_ENEMY_INIT:
	la	t0, PLAYER_POS	
	lw 	t3, 4(t0)	
	beq 	t3, t1, ENEMY_X_DAMAGE
	bge 	t3, t1, ENEMY_UP_DAMAGE	#Esta encima
	
	#senao esta abaixo
	#DAMAGE?
	addi 	t0, t3, 48		#Altura Ricther
	addi 	t0, t0, -10		#Corre��o maunal
	bge 	t1, t0, STANCE_ENEMY	#NO_DAMAGE_BY_ENEMY
	#continua	
	j  	ENEMY_X_DAMAGE
	
	ENEMY_UP_DAMAGE:
	#senao esta acima
	#DAMAGE?
	add 	t0, t1, t4		#Altura enemy
	addi 	t0, t0, -10		#Corre��o manual
	bge 	t3, t0, STANCE_ENEMY	#NO_DAMAGE_BY_ENEMY
	#continua	
	
	ENEMY_X_DAMAGE:						
	#Determina largura do inimigo para t4
		li t0, -73
		beq t0, t5, HEART_HEIGHT3
		
		li t0, 38
		bge t0, t5, GHOST_HEIGHT3
			
		li t0, 72
		bge t0, t5, ZOMBIE_HEIGHT3	
		
		li t0,179
		bge t0, t5, KNIGHT_HEIGHT3	
		
		li t0, 202
		bge t0, t5, THORNS_HEIGHT3	
		
		li t0, 203
		bge t0, t5, SLIME_HEIGHT3	
		
		li t0, 204
		bge t0, t5, BONES_HEIGHT3				
		
		li t0, 300
		bge t0, t5, MORTE_HEIGHT3												
																																						
		GHOST_HEIGHT3:
		la t0, GHOST_SIZE
		lh t4, 0(t0)
		j ENEMY_X_DAMAGE_INIT
		
		ZOMBIE_HEIGHT3:
		la t0, ZOMBIE_SIZE
		lh t4, 0(t0)
		j ENEMY_X_DAMAGE_INIT
		
		KNIGHT_HEIGHT3:
		la t0, KNIGHT_SIZE
		lh t4, 0(t0)
		j ENEMY_X_DAMAGE_INIT
		
		THORNS_HEIGHT3:
		la t0, THORNS_SIZE
		lh t4, 0(t0)
		j ENEMY_X_DAMAGE_INIT
		
		SLIME_HEIGHT3:
		la t0, SLIME_SIZE
		lh t4, 0(t0)
		j ENEMY_X_DAMAGE_INIT
		
		HEART_HEIGHT3:
		la t0, Heart_size
		lh t4, 0(t0)
		j ENEMY_X_DAMAGE_INIT	
		
		BONES_HEIGHT3:
		la t0, BONES_SIZE
		lh t4, 0(t0)
		j ENEMY_X_DAMAGE_INIT		
		
		MORTE_HEIGHT3:
		la t0, MORTE_SIZE
		lh t4, 0(t0)
		j ENEMY_X_DAMAGE_INIT																	
		
	ENEMY_X_DAMAGE_INIT:
	
	la	t0, PLAYER_POS					
	lw 	t3, 0(t0)	
	beq 	t3, t2, DAMAGED_BY_ENEMY_LEFT
	bge 	t3, t2, ENEMY_RIGHT_DAMAGE	#Esta a direita		
	#senao esta a esquerda
	#DAMAGE?
	addi 	t0, t3, 24		#largura Ricther
	addi 	t0, t0, 0		#Corre��o maunal
	bge 	t2, t0, STANCE_ENEMY	#NO_DAMAGE_BY_ENEMY
	#continua	
	j  	DAMAGED_BY_ENEMY_LEFT
	
	ENEMY_RIGHT_DAMAGE:
	#senao esta a direita
	add 	t0, t2, t4		#largura enemy
	addi 	t0, t0, 0		#Corre��o manual
	bge 	t3, t0, STANCE_ENEMY	#NO_DAMAGE_BY_ENEMY
	
	
	
DAMAGED_BY_ENEMY_RIGHT:	
li t0, -71
beq t0, t5, HEART_COLLECT
li t0, -74
beq t0, t5, CALICE_COLLECT
li t4, -1
bge t4, t5, DEATH_ENEMY

la t0, Ritcher_IMUNITY	
lb t3, 0(t0)
bnez t3, STANCE_ENEMY		#NO damage pq esta imune		
				
la 	t0, HP
lb 	t3, 0(t0)	
addi 	t3, t3, -1
sb 	t3, 0(t0)	#Pega o valor de HP e diminue em 1

la t0, 	Ritcher_damaged
li t4, 1
sb t4, 0(t0)		#Ativa o ritvher_damaged para a stance			
li t0, 	3
fcvt.s.w fs2, t0	#lan�ado para direita
li t0, 	-2
fcvt.s.w fs3, t0	#lan�ado para cima										
j IMUNITY

DAMAGED_BY_ENEMY_LEFT:
li t0, -71
beq t0, t5, HEART_COLLECT
li t0, -74
beq t0, t5, CALICE_COLLECT
li t4, -1
bge t4, t5, DEATH_ENEMY


la t0, Ritcher_IMUNITY	
lb t3, 0(t0)
bnez t3, STANCE_ENEMY		#NO damage pq esta imune		


la 	t0, HP
lb 	t3, 0(t0)	
addi 	t3, t3, -1
sb 	t3, 0(t0)	#Pega o valor de HP e diminue em 1

la t0, 	Ritcher_damaged
li t4, 1
sb t4, 0(t0)	#Ativa o ritvher_damaged para a stance	
li t0, 	-3
fcvt.s.w fs2, t0	#lan�ado para esquerda
li t0, 	-2
fcvt.s.w fs3, t0	#lan�ado para cima
	
IMUNITY:
la t0, Ritcher_IMUNITY
lb t3, 0(t0)
beqz t3, START_IMUNITY			#Se for igual a zero siginifica que se esta iniciando
j STANCE_ENEMY
																																														
	START_IMUNITY:
	li t3, IMUNITY_TIME	
	sb t3, 0(t0)																																																																																														
																																																																																																																																																																																													
STANCE_ENEMY:

li a6, 0
li a7, 0

li t0, -1
bge t0, t5, DEATH_ENEMY

li t0, 6
bge t0, t5, Ghost0
li t0, 12
bge t0, t5, Ghost1
li t0, 18
bge t0, t5, Ghost2
li t0, 26
bge t0, t5, Ghost3
li t0, 30
bge t0, t5, Ghost4
li t0, 34
bge t0, t5, Ghost5
li t0, 38
bge t0, t5, Ghost6

li t0, 39
bge t0, t5, Zombie0
li t0, 45
bge t0, t5, Zombie1
li t0, 51
bge t0, t5, Zombie2
li t0, 57
bge t0, t5, Zombie3
li t0, 63
bge t0, t5, Zombie4
li t0, 67
bge t0, t5, Zombie5
li t0, 71
bge t0, t5, Zombie6
li t0, 72
bge t0, t5, Zombie7


li t0, 78
bge t0, t5, Knight0
li t0, 84
bge t0, t5, Knight1
li t0, 90
bge t0, t5, Knight2
li t0, 96
bge t0, t5, Knight3
li t0, 102
bge t0, t5, Knight4
li t0, 103
bge t0, t5, Knight5

#Power
li t0, 109
bge t0, t5, Knight6
li t0, 119
bge t0, t5, Knight7
li t0, 129
bge t0, t5, Knight8
li t0, 159
bge t0, t5, Knight9
li t0, 200
bge t0, t5, Knight10
li t0, 201
bge t0, t5, Shockwave

li t0, 202
bge t0, t5, THORNS
li t0, 203
bge t0, t5, SLIME

li t0, 209
bge t0, t5, Bones0
li t0, 215
bge t0, t5, Bones1
li t0, 221
bge t0, t5, Bones2
li t0, 227
bge t0, t5, Bones3
li t0, 233
bge t0, t5, Bones4
li t0, 234
bge t0, t5, Bones5



li t0, 245
bge t0, t5, Morte0
li t0, 255
bge t0, t5, Morte1
li t0, 265
bge t0, t5, Morte2
li t0, 252
bge t0, t5, Morte3
li t0, 275
bge t0, t5, Morte4
li t0, 285
bge t0, t5, Morte5
li t0, 295
bge t0, t5, Morte6

#ATAQUE MORTE(come�a em 296)
li t0, 305
bge t0, t5, Morte7
li t0, 315
bge t0, t5, Morte8
li t0, 325
bge t0, t5, Morte9
li t0, 335
bge t0, t5, Morte10
li t0, 345
bge t0, t5, Morte11
li t0, 355
bge t0, t5, Morte12
li t0, 365
bge t0, t5, Morte13
li t0, 375
bge t0, t5, Morte14

#Power de morte
li t0, 385
bge t0, t5, Orb0
li t0, 395
bge t0, t5, Orb1
li t0, 405
bge t0, t5, Orb2
li t0, 415
bge t0, t5, Orb3
li t0, 425
bge t0, t5, Orb4
li t0, 430
bge t0, t5, Orb5
li t0, 435
bge t0, t5, Orb6
li t0, 440
bge t0, t5, Orb7
li t0, 441
bge t0, t5, Orb8
ret		


#----------------------------------------GHOST-----------------------------------------------------
Ghost0:
	la 	a4, GHOST_SIZE
	addi 	a6, a6, 0
	li 	a7, 0
	addi 	t5, t5, 1		#move stance
		j  Ghost_behaviour

	


Ghost1:
	la 	a4, GHOST_SIZE
	addi 	a6, a6, 18
	li 	a7, 0
	addi 	t5, t5, 1		#move stance
		j  Ghost_behaviour
		ret


Ghost2:
	la 	a4, GHOST_SIZE
	addi 	a6, a6, 44
	li 	a7, 0
	addi 	t5, t5, 1		#move stance
		j  Ghost_behaviour


Ghost3:
	la 	a4, GHOST_SIZE
	addi 	a6, a6, 65
	li 	a7, 0
	addi 	t5, t5, 1		#move stance	
		j  Ghost_behaviour

		
		
Ghost4:
	la 	a4, GHOST_SIZE
	addi 	a6, a6, 90
	li 	a7, 0
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	#se aproxima do y do personagem
	bge 	t2, t3, GHOST_LEFT4	#Esta a esquerda
	addi 	a6, a6, 413
		GHOST_LEFT4:
		addi 	t5, t5, 1		#move stance
		j  Ghost_behaviour
	
		
		

Ghost5:
	la 	a4, GHOST_SIZE
	addi 	a6, a6, 116
	li 	a7, 0
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	#se aproxima do y do personagem
	bge 	t2, t3, GHOST_LEFT5	#Esta a esquerda
	addi 	a6, a6, 362
		GHOST_LEFT5:
		addi 	t5, t5, 1		#stance
		j  Ghost_behaviour




Ghost6:
	la 	a4, GHOST_SIZE
	addi 	a6, a6, 90
	li 	a7, 0
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	#se aproxima do y do personagem
	bge 	t2, t3, GHOST_LEFT6	#Esta a esquerda
	addi 	a6, a6, 413	
		GHOST_LEFT6:
		li 	t5, 27		#Reseta stance
		j  Ghost_behaviour


Ghost_behaviour:	

	la	t0, PLAYER_POS	
	lw 	t3, 4(t0)	#se aproxima do y do personagem
	li 	t4, GHOST_VELOCITY
	beq 	t3, t1, GHOST_X
	bge 	t3, t1, GHOST_UP	#Esta encima
	
	#senao esta abaixo
	sub 	t1, t1, t4	
	j  	GHOST_X
	
	GHOST_UP:
	#senao esta acima
	add	t1, t1, t4
	
	GHOST_X:						
	la	t0, PLAYER_POS					
	lw 	t3, 0(t0)	#se aproxima do y do personagem
	beq 	t3, t2, ENEMY_NEXT
	bge 	t3, t2, GHOST_RIGHT	#Esta a direita
	
	#senao esta a esquerda
	sub	t2, t2, t4
	j 	ENEMY_NEXT
	GHOST_RIGHT:		
	add 	t2, t2, t4
	j ENEMY_NEXT	
																																																												
#----------------------------------------ZOMBIE-----------------------------------------------------
Zombie0:
	la 	a4, ZOMBIE_SIZE
	addi 	a6, a6, 227
	li 	a7, 72
	addi 	t5, t5, 0		#move stance
	j  Zombie_behaviour

Zombie1:
	la 	a4, ZOMBIE_SIZE
	addi 	a6, a6, 194
	li 	a7, 72
	addi 	t5, t5, 1		#move stance
	j  Zombie_behaviour
	
Zombie2:
	la 	a4, ZOMBIE_SIZE
	addi 	a6, a6, 160
	li 	a7, 72
	addi 	t5, t5, 1		#move stance
	j  Zombie_behaviour
	
Zombie3:
	la 	a4, ZOMBIE_SIZE
	addi 	a6, a6, 126
	li 	a7, 72
	addi 	t5, t5, 1		#move stance
	j   Zombie_behaviour			

Zombie4:
	la 	a4, ZOMBIE_SIZE
	addi 	a6, a6, 484
	li 	a7, 72
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3, ZOMBIE_RIGHT_S	#Esta a esquerda ritcher
	li 	a6, 93
		ZOMBIE_RIGHT_S:
		addi 	t5, t5, 1		#stance
		j   Zombie_behaviour	
Zombie5:
	la 	a4, ZOMBIE_SIZE
	addi 	a6, a6, 551
	li 	a7, 72
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3, ZOMBIE_RIGHT_S2	#Esta a esquerda ritcher
	li	 a6, 31
		ZOMBIE_RIGHT_S2:
		addi 	t5, t5, 1		#stance
		j   Zombie_behaviour
	
Zombie6:
	la 	a4, ZOMBIE_SIZE
	addi 	a6, a6, 582
	li 	a7, 72
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3, ZOMBIE_RIGHT_S3	#Esta a esquerda ritcher
	li	 a6, 0
		ZOMBIE_RIGHT_S3:
		addi 	t5, t5, 1		#stance
		j   Zombie_behaviour
		
Zombie7:
	li t5, 63		#stance
	j   Zombie5
						
				
		
Zombie_behaviour:
	li t4, 40
	bge t5, t4, ZOMBIE_ATK
	la	t0, PLAYER_POS					
	lw 	t3, 0(t0)	
	bge	t3, t2, ZOMBIE_LEFT
	ZOMBIE_RIGHT:
	sub t3, t2, t3
	li t4, 100			#Distancia minima para zombie levantar do chao
	bge t4, t3, ZOMBIE_WAKE_UP_Y
	j ENEMY_NEXT
	ZOMBIE_LEFT:
	sub t3, t3, t2
	li t4, 100			#Distancia minima para zombie levantar do chao
	bge t4, t3, ZOMBIE_WAKE_UP_Y
	j ENEMY_NEXT
	
					
	ZOMBIE_WAKE_UP_Y:
	la	t0, PLAYER_POS					
	lw 	t3, 2(t0)	
	bge	t3, t1, ZOMBIE_UP
	ZOMBIE_DOWN:
	sub t3, t3, t1
	li t4, 100			#Distancia minima para zombie levantar do chao
	bge t4, t3, ZOMBIE_WAKE_UP
	j ENEMY_NEXT
	ZOMBIE_UP:
	sub t3, t1, t3
	li t4, 100			#Distancia minima para zombie levantar do chao
	bge t4, t3, ZOMBIE_WAKE_UP
	j ENEMY_NEXT
	
	ZOMBIE_WAKE_UP:
	addi t5, t5, 1			#Aumenta stance para levantar do chao																																																
	j ENEMY_NEXT

	ZOMBIE_ATK:
	la	t0, PLAYER_POS					
	lw 	t3, 0(t0)	
	bge	t3, t2, ZOMBIE_LEFT_ATK
	
	sub t0, s7, t2			#Posicao inicial - posicao fina
	li t4, 200			#Distancia maxima da posicao inicial
	ble t4, t0, ENEMY_NEXT	
	sub t3, t2, t3
	li t4, 130			#Distancia minima para zombie andar para tras
	bge t4, t3, ZOMBIE_ATKX
	li t4, 150			#Distancia maxima para zombie andar para tras
	bge t3, t4, ENEMY_NEXT
	
	
	
	addi 	t2, t2, 1
	j ENEMY_NEXT
	ZOMBIE_ATKX:
	addi 	t2, t2, -1
	j ENEMY_NEXT
	

	ZOMBIE_LEFT_ATK:
	sub t0, t2, s7			#Posicao inicial - posicao final
	li t4, 200			#Distancia maxima da posicao inicial
	ble t4, t0, ENEMY_NEXT	
	sub t3, t3, t2
	li t4, 110			#Distancia minima para zombie andar para tras
	bge t4, t3, ZOMBIE_ATKX2
	li t4, 150			#Distancia maxima para zombie andar para tras
	bge t3, t4, ENEMY_NEXT
	
	addi 	t2, t2, -1
	j ENEMY_NEXT
	ZOMBIE_ATKX2:
	addi 	t2, t2, 1
	j ENEMY_NEXT

	
#----------------------------------------KNIGHT-----------------------------------------------------
		
	Knight0:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 12
	li 	a7, 222
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT0_J	#Esta a esquerda ritcher
	li	a6, 648
	li 	a7, 218
		KNIGHT0_J:
		addi 	t5, t5, 1		#stance
		j  Knight_behaviour						
								
										
	Knight1:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 61
	li 	a7, 222
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT1_J	#Esta a esquerda ritcher
	li	a6, 600
	li 	a7, 218
		KNIGHT1_J:
		addi 	t5, t5, 1		#stance
		j  Knight_behaviour															
														
	Knight2:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 110
	li 	a7, 222
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT2_J	#Esta a esquerda ritcher
	li	a6, 545
	li 	a7, 218
		KNIGHT2_J:
		addi 	t5, t5, 1		#stance
		j  Knight_behaviour																			
																		
	Knight3:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 158
	li 	a7, 222
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT3_J	#Esta a esquerda ritcher
	li	a6, 498
	li 	a7, 218
		KNIGHT3_J:
		addi 	t5, t5, 1		#stance
		j  Knight_behaviour																				
																						
	Knight4:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 211
	li 	a7, 222
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT4_J	#Esta a esquerda ritcher
	li	a6, 450
	li 	a7, 218
		KNIGHT4_J:
		addi 	t5, t5, 1		#stance
		j  Knight_behaviour																									
	
	Knight5:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 211
	li 	a7, 222
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT5_J	#Esta a esquerda ritcher
	li	a6, 450
	li 	a7, 218
		KNIGHT5_J:
		li 	t5, 73		#stance
		j 	Knight_behaviour	
	
	
	Knight6:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 9
	li 	a7, 330
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT6_J	#Esta a esquerda ritcher
	li	a6, 995
	li 	a7, 330
		KNIGHT6_J:
		addi 	t5, t5, 1		#stance
		j  	Knight_behaviour																																																																																																																																																																																																								
																																																																																																																																																																																																									
	Knight7:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 70
	li 	a7, 330
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT7_J	#Esta a esquerda ritcher
	li	a6, 928
	li 	a7, 330
		KNIGHT7_J:
		addi 	t5, t5, 1		#stance
		j  	Knight_behaviour
	
	Knight8:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 133
	li 	a7, 330
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT8_J	#Esta a esquerda ritcher
	li	a6, 874
	li 	a7, 330
		KNIGHT8_J:
		addi 	t5, t5, 1		#stance
		j  	Knight_behaviour
		
	Knight9:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 256
	li 	a7, 330
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT9_J	#Esta a esquerda ritcher
	li	a6, 746
	li 	a7, 330
		KNIGHT9_J:
		addi 	t5, t5, 1		#stance
		
		
		la	t0, PLAYER_POS
		lw 	t3, 0(t0)	
		bge 	t2, t3,  KNIGHT9_J2	#Esta a esquerda ritcher
		
		mv s6, t2
		mv s7, t1
		addi s7, s7, 32		#diferen�a de altura
		addi s6, s6, 250
		mv s8, s6
		addi s6, s6, -250
		j SHOCKWAVES
		KNIGHT9_J2:
		mv s6, t2
		mv s7, t1
		addi s7, s7, 32		#diferen�a de altura
		addi s6, s6,-250
		mv s8, s6
		addi s6, s6, 250
		
		SHOCKWAVES:
		li 	t0, 140
		beq 	t0, t5, ADD_SHOCKWAVE		#Se igual a 130 cria onda de choque
		j  	Knight_behaviour			
				
																																																																																																																																																																																																																																																																																																														
	Knight10:				
	la 	a4, KNIGHT_SIZE
	li  	a6, 326
	li 	a7, 330
	la	t0, PLAYER_POS
	lw 	t3, 0(t0)	
	bge 	t2, t3,  KNIGHT10_J	#Esta a esquerda ritcher
	li	a6, 667
	li 	a7, 330
		KNIGHT10_J:
		addi 	t5, t5, 1		#stance
		li 	t5, 73		#stance
		j  	Knight_behaviour																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																					
		
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																					
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																								
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																	
	Knight_behaviour:
	la	t0, PLAYER_POS					
	lw 	t3, 0(t0)	
	bge	t3, t2, KNIGHT_LEFT_ATK
	
	
	sub t0, s7, t2			#Posicao inicial - posicao fina
	li t4, 150			#Distancia maxima da posicao inicial
	beq t4, t0, KNIGHT_ATKZ
	ble t4, t0, ENEMY_NEXT	
	sub t0, t2, s7			#Posicao inicial - posicao final
	li t4, 150			#Distancia maxima da posicao inicial
	beq t4, t0, KNIGHT_ATKX
	ble t4, t0, ENEMY_NEXT	
	
	sub t3, t2, t3
	li t4, 110			#Distancia minima para zombie andar para tras
	bge t4, t3, KNIGHT_ATKX
	li t4, 150			#Distancia maxima para zombie andar para tras
	bge t3, t4, ENEMY_NEXT 
	li t4, 130			#Distancia minima para zombie andar para tras
	bge t3, t4, KNIGHT_POWER
	
	
	KNIGHT_ATKZ:	
	addi 	t2, t2, 1
	j ENEMY_NEXT
	KNIGHT_ATKX:
	addi 	t2, t2, -1
	j ENEMY_NEXT
	

	KNIGHT_LEFT_ATK:
	sub t0, t2, s7			#Posicao inicial - posicao final
	li t4, 150			#Distancia maxima da posicao inicial
	beq t4, t0, KNIGHT_ATKX
	ble t4, t0, ENEMY_NEXT	
	sub t0, s7, t2			#Posicao inicial - posicao fina
	li t4, 150			#Distancia maxima da posicao inicial
	beq t4, t0, KNIGHT_ATKX2
	ble t4, t0, ENEMY_NEXT	
	sub t3, t3, t2
	li t4, 110			#Distancia minima para zombie andar para tras
	bge t4, t3, KNIGHT_ATKX2
	li t4, 150			#Distancia maxima para zombie andar para tras
	bge t3, t4, ENEMY_NEXT
	li t4, 130			#Distancia minima para zombie andar para tras
	bge t3, t4, KNIGHT_POWER
	
	
	addi 	t2, t2, -1
	j ENEMY_NEXT
	KNIGHT_ATKX2:
	addi 	t2, t2, 1
	j ENEMY_NEXT																				
																														
	KNIGHT_POWER:
	li t0, 103
	bge t0, t5, START_KNIGHT_POWER	
	j ENEMY_NEXT	
	START_KNIGHT_POWER:
	li t5, 	104			#Stance inicial para ataque																													
	j ENEMY_NEXT																																		
																																				
																																						
																																								
																																										
	Shockwave:																																												
	la 	a4, SHOCKWAVE_SIZE
	li  	a6, 500
	li 	a7, 356
	#Behavior																																													
	bge t2, s7, SHOCKWAVE_ESQ
	#Indo para direita
	li t0, SHOCKWAVE_VELOCITY
	add t2, t2, t0
	bge t2, s7, END_SHOCKWAVE
	j ENEMY_NEXT	
	
	SHOCKWAVE_ESQ:
	#Indo para a esquerda
	li t0, SHOCKWAVE_VELOCITY
	sub t2, t2, t0
	bge s7, t2, END_SHOCKWAVE
	j ENEMY_NEXT																																																																																																
			
	END_SHOCKWAVE:
	ret			
					
#----------------------------------------THORNS-----------------------------------------------------	
	THORNS: 
	la 	a4, THORNS_SIZE
	li  	a6, 235
	li 	a7, 0				
	j ENEMY_NEXT										
#----------------------------------------SLIME-----------------------------------------------------																
	SLIME:																				
	la 	a4, SLIME_SIZE
	li  	a6, 289
	li 	a7, 0																								
	j ENEMY_NEXT																													
																																				
#----------------------------------------BONES-----------------------------------------------------	
	Bones0:
	la 	a4, BONES_SIZE
	li  	a6, 269
	li 	a7, 141
	
	bge 	t2, s7,  BONES0_J	#Esta a esquerda
	li	a6, 0
	li 	a7, 141
		BONES0_J:	
		addi t5, t5, 1																																											
		j Bones_behaviour
		
	Bones1:
	la 	a4, BONES_SIZE
	li  	a6, 245
	li 	a7, 141
	
	bge 	t2, s7,  BONES1_J	#Esta a esquerda
	li	a6, 24
	li 	a7, 141
		BONES1_J:	
		addi t5, t5, 1																																											
		j Bones_behaviour	
		
	Bones2:
	la 	a4, BONES_SIZE
	li  	a6, 224
	li 	a7, 141
	
	bge 	t2, s7,  BONES2_J	#Esta a esquerda
	li	a6, 44
	li 	a7, 141
		BONES2_J:	
		addi t5, t5, 1																																											
		j Bones_behaviour																																																																																																																																																																																																																																																																																
	
	Bones3:
	la 	a4, BONES_SIZE
	li  	a6, 202
	li 	a7, 141
	
	bge 	t2, s7,  BONES3_J	#Esta a esquerda
	li	a6, 68
	li 	a7, 141
		BONES3_J:	
		addi t5, t5, 1																																											
		j Bones_behaviour	
		
	Bones4:
	la 	a4, BONES_SIZE
	li  	a6, 176
	li 	a7, 141
	
	bge 	t2, s7,  BONES4_J	#Esta a esquerda
	li	a6, 92
	li 	a7, 141
		BONES4_J:	
		addi t5, t5, 1																																											
		j Bones_behaviour																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														
	
	Bones5:
	la 	a4, BONES_SIZE
	li  	a6, 176
	li 	a7, 141
	
	bge 	t2, s7,  BONES5_J	#Esta a esquerda
	li	a6, 92
	li 	a7, 141
		BONES5_J:	
		li t5, 204																																										
		j Bones_behaviour	
		
	
	Bones_behaviour:
		bge 	t2, s7,  BONES_J	#Esta a esquerda 
		addi	t2, t2, 1
		beq 	t2, s7, PATRULHA_DIR
		j ENEMY_NEXT	
		BONES_J:
		addi	t2, t2, -1
		beq 	t2, s7, PATRULHA_ESQ
		j ENEMY_NEXT
			PATRULHA_DIR:
			addi s7, s7, -150
			j ENEMY_NEXT	
	
			PATRULHA_ESQ:
			addi s7, s7, 150
			j ENEMY_NEXT														
				
																						
#---------------------------------------MORTE-----------------------------------------------------																																							
	Morte0:																				
	la 	a4, MORTE_SIZE
	li  	a6, 98
	li 	a7, 687	
	addi	t5, t5, 1																								
	j 	Morte_behaviour																																																										
																																																																												
																																																																																														
	Morte1:																				
	la 	a4, MORTE_SIZE
	li  	a6, 187
	li 	a7, 687
	addi	t5, t5, 1																								
	j 	Morte_behaviour																																																																																																																
																																																																																																																																		
																																																																																																																																																				
	Morte2:																				
	la 	a4, MORTE_SIZE
	li  	a6, 276
	li 	a7, 687
	addi	t5, t5, 1																								
	j 	Morte_behaviour																																																																																																																																																																						
																																																																																																																																																																																								
																																																																																																																																																																																																										
	Morte3:																				
	la 	a4, MORTE_SIZE
	li  	a6, 365
	li 	a7, 687
	addi	t5, t5, 1																									
	j 	Morte_behaviour																																																																																																																																																																																																																												
																																																																																																																																																																																																																																														
																																																																																																																																																																																																																																																																
	Morte4:																				
	la 	a4, MORTE_SIZE
	li  	a6, 454
	li 	a7, 687	
	addi	t5, t5, 1																								
	j 	Morte_behaviour																																																																																																																																																																																																																																																																																		
																																																																																																																																																																																																																																																																																																				
																																																																																																																																																																																																																																																																																																																						
	Morte5:																				
	la 	a4, MORTE_SIZE
	li  	a6, 543
	li 	a7, 687
	addi	t5, t5, 1																								
	j 	Morte_behaviour																																																																																																																																																																																																																																																																																																																																								
																																																																																																																																																																																																																																																																																																																																																										
																																																																																																																																																																																																																																																																																																																																																																												
	Morte6:																				
	la 	a4, MORTE_SIZE
	li  	a6, 543
	li 	a7, 687
	li 	t5, 236																							
	j 	Morte_behaviour	
	
	
	Morte7:																				
	la 	a4, MORTE_SIZE
	li  	a6, 14
	li 	a7, 897
	addi	t5, t5, 1																						
	j 	Morte_behaviour																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											
	
	Morte8:																				
	la 	a4, MORTE_SIZE
	li  	a6, 103
	li 	a7, 897
	addi	t5, t5, 1																						
	j 	Morte_behaviour	
	
	Morte9:																				
	la 	a4, MORTE_SIZE
	li  	a6, 192
	li 	a7, 897
	addi	t5, t5, 1																						
	j 	Morte_behaviour	
	
	Morte10:																				
	la 	a4, MORTE_SIZE
	li  	a6, 281
	li 	a7, 897
	addi	t5, t5, 1																						
	j 	Morte_behaviour	
	
	Morte11:																				
	la 	a4, MORTE_SIZE
	li  	a6, 370
	li 	a7, 897
	addi	t5, t5, 1																						
	j 	Morte_behaviour	
	
	Morte12:																				
	la 	a4, MORTE_SIZE
	li  	a6, 459
	li 	a7, 897
	addi	t5, t5, 1																						
	j 	Morte_behaviour	
	
	Morte13:																				
	la 	a4, MORTE_SIZE
	li  	a6, 548
	li 	a7, 897
	addi	t5, t5, 1																						
	j 	Morte_behaviour	
	
	Morte14:																				
	la 	a4, MORTE_SIZE
	li  	a6, 548
	li 	a7, 897
	li 	t5, 236																						
	j 	Morte_behaviour	
	
	Morte_behaviour:
	beq t2, s7, MORTE_ATK	#Fica imovel, esta na posi��o desejada e ataca
	bge t2, s7, MORTE_TO_ESQ		#Se t2 maior que s7, significa que esta indo para esquerda
			#Indo para direita
			addi t2, t2, 4
			j ENEMY_NEXT
			MORTE_TO_ESQ:
			addi t2, t2, -3
			j ENEMY_NEXT
	MORTE_ATK:
	li t0, 340
	beq t0, t5, ATK_ORBS	#Cast de orbs	
	li t0, 296	#Se maior que 296, continua o valor
	bge t5, t0, ENEMY_NEXT
	li t5, 296				
	j ENEMY_NEXT																																																																																																																																																																																																																																																																																																																																																																																																																																																			
	
	ATK_ORBS:
	mv s8, t2
	mv s9, t1
	li t0, 2000
	bge s10, t0, ENEMY_NEXT #Limite de inimigos na tela
	jal s6, ADD_ORB	
	
	addi s8, s8, 80		#Bola pela outra mao da morte tambem
	jal s6, ADD_ORB	
	j ENEMY_NEXT																																																																																																																																																																																																																																																																																																																																																																																																																																																																																						
	
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																						
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																					
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																										
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																															
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
	Orb0:
	la 	a4, ORB_SIZE
	li  	a6, 16
	li 	a7, 812
	addi 	t5, t5, 1																					
	j 	Orb_behaviour																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																					
	
	Orb1:
	la 	a4, ORB_SIZE
	li  	a6, 52
	li 	a7, 812
	addi 	t5, t5, 1																					
	j 	Orb_behaviour	
	
	Orb2:
	la 	a4, ORB_SIZE
	li  	a6, 88
	li 	a7, 812
	addi 	t5, t5, 1																					
	j 	Orb_behaviour
	
	Orb3:
	la 	a4, ORB_SIZE
	li  	a6, 124
	li 	a7, 812
	addi 	t5, t5, 1																					
	j 	Orb_behaviour	
	
	Orb4:
	la 	a4, ORB_SIZE
	li  	a6, 160
	li 	a7, 812
	addi 	t5, t5, 1																					
	j 	Orb_behaviour
	
	Orb5:
	la 	a4, ORB_SIZE
	li  	a6, 196
	li 	a7, 812
	addi 	t5, t5, 1																					
	j 	Orb_behaviour	
	
	Orb6:
	la 	a4, ORB_SIZE
	li  	a6, 232
	li 	a7, 812
	addi 	t5, t5, 1																					
	j 	Orb_behaviour		
	
	Orb7:
	la 	a4, ORB_SIZE
	li  	a6, 268
	li 	a7, 812
	addi 	t5, t5, 1																			
	j 	Orb_behaviour	
	
	Orb8:
	la 	a4, ORB_SIZE
	li  	a6, 304
	li 	a7, 812
	li	t5, 426																					
	j 	Orb_behaviour	
	
	Orb_behaviour:
	la	t0, PLAYER_POS	
	lw 	t3, 4(t0)	#se aproxima do y do personagem
	li 	t4, 1		#Velocidade
	bge 	t3, t1, ORB_UP	#Esta encima
	
	#senao esta abaixo
	sub 	t1, t1, t4	
	j  	ORB_X
	
	ORB_UP:
	#senao esta acima
	add	t1, t1, t4
	
	ORB_X:						
	la	t0, PLAYER_POS					
	lw 	t3, 0(t0)	#se aproxima do y do personagem
	beq 	t3, t2, ENEMY_NEXT
	bge 	t3, t2, ORB_RIGHT	#Esta a direita
	
	#senao esta a esquerda
	sub	t2, t2, t4
	j 	ENEMY_NEXT
	ORB_RIGHT:		
	add 	t2, t2, t4
	
	j ENEMY_NEXT
	
#---------------------------------------Death enemy-----------------------------------------------------																																																																														
DEATH_INIT:
li t5, -1

DEATH_ENEMY:

li t0, -5
bge t5, t0, Death0
li t0, -10
bge t5, t0, Death1
li t0, -15
bge t5, t0, Death2
li t0, -20
bge t5, t0, Death3
li t0, -25
bge t5, t0, Death4
li t0, -30
bge t5, t0, Death5
li t0, -35
bge t5, t0, Death6
li t0, -40
bge t5, t0, Death7
li t0, -45
bge t5, t0, Death8
li t0, -50
bge t5, t0, Death9
li t0, -55
bge t5, t0, Death10
li t0, -60
bge t5, t0, Death11
li t0, -65
bge t5, t0, Death12
li t0, -70
bge t5, t0, Death13
li t0, -73
bge t5, t0, HEART
li t0, -74
bge t5, t0, CALICE
li t0, -75
bge t5, t0, LAMARZINHO
ret

Death0:
	la 	a4, Death_enemy_size
	li	a6, 3
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT
		
Death1:
	la 	a4, Death_enemy_size
	li 	a6, 35
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT
		
Death2:
	la 	a4, Death_enemy_size
	li 	a6, 67
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT	
		
Death3:
	la 	a4, Death_enemy_size
	li 	a6, 100
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT	
		
Death4:
	la 	a4, Death_enemy_size
	li 	a6, 141
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT	
		
Death5:
	la 	a4, Death_enemy_size
	li 	a6, 175
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT
		
Death6:
	la 	a4, Death_enemy_size
	li 	a6, 207
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT	
		
Death7:
	la 	a4, Death_enemy_size
	li 	a6, 238
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT	
		
Death8:
	la 	a4, Death_enemy_size
	li 	a6, 281
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT
		
Death9:
	la 	a4, Death_enemy_size
	li 	a6, 314
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																
		
Death10:
	la 	a4, Death_enemy_size
	li 	a6, 346
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT
		
Death11:
	la 	a4, Death_enemy_size
	li 	a6, 377
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT		
		
		
Death12:
	la 	a4, Death_enemy_size
	li 	a6, 422
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
		j  ENEMY_NEXT	
		
		
Death13:
	la 	a4, Death_enemy_size
	li 	a6, 455
	li 	a7, 489
	addi 	t5, t5, -1		#move stance
	
	
		#Ultima morte entao verifica a chance de dropar um coracao
		GERAR_ALEATORIO:
		#Guarda os registradores 
		mv t0, a7
		mv t3, a1
		mv t4, a0
		li a7, 40#RandSeed
		ecall
		li a1, 2	#Definir limite
		addi a0, a0, 272#Somar valor aleatorio (n sei pq)
		li a7, 42	#Gera o numero
		ecall
		mv t3, a0	#Armazena numero aleatorio (0 ou 1) em t3
		#Retorna os valores originais dos registradores a
		mv a7, t0
		mv a1, t3
		mv a0, t4
		
		#Se for 1:
		li t0, 1
		beq t3, t0, DROPA_CORACAO
		ret																											

LAMARZINHO_COLLECT:
la 	t0, SETOR
lb	t4, 0(t0)
li 	t3, 1
beq 	t4, t3, DIALOGO_P1
li 	t3, 8
beq 	t4, t3, DIALOGO_P8
j 	LAMARZINHO

	DIALOGO_P1:
	la 	t0, DIALOGO_STANCE
	li 	t3, 1
	sh 	t3, 0(t0)	
	j 	LAMARZINHO
	
	DIALOGO_P8:
	la 	t0, DIALOGO_STANCE
	li 	t3, 1
	sh 	t3, 0(t0)	
	j 	LAMARZINHO

LAMARZINHO:
	la 	a4, Lamar_size
	li 	a6, 577
	li 	a7, 577
	j	ENEMY_NEXT	


CALICE_COLLECT:
	la 	t0, CALICE_NUM	#Aumenta mana 
	lb	t1, 0(t0) 
	addi	t1, t1, 1
	sb 	t1, (t0)
	la 	t0, SETOR
	lb	t4, 0(t0)
	li 	t3, 1
	beq 	t4, t3, CALICE_P1_OFF
	li 	t3, 4
	beq 	t4, t3, CALICE_P4_OFF
	li 	t3, 5
	beq 	t4, t3, CALICE_P5_OFF
	j 	CALICE
	
		CALICE_P1_OFF:
		la t0, Calice1
		sb zero, 0(t0)
		j CALICE	
	
		CALICE_P4_OFF:
		la t0, Calice2
		sb zero, 0(t0)
		j CALICE
		
		CALICE_P5_OFF:
		la t0, Calice3
		sb zero, 0(t0)
		j CALICE

	
	
			
				
					
							
CALICE:
	la 	a4, Calice_size
	li 	a6, 614
	li 	a7, 503
	j	ENEMY_NEXT
	

HEART_COLLECT:
	la 	t0, MANA	#Aumenta mana 
	lb	t1, 0(t0) 
	li	t2, 99		#maximo
	bge	t1, t2, NO_MORE_MANA
	addi 	t1, t1, 4
	bge	t2, t1, NO_MORE_MANA
	li 	t1, 99
	NO_MORE_MANA:
	sb 	t1, 0(t0)
	
	la 	t0, HP	#Aumenta vida
	lb	t1, 0(t0)
	li	t2, 15	#maximo
	beq	t1, t2, NO_MORE_HP
	addi 	t1, t1, 1
	NO_MORE_HP:	
	sb 	t1, 0(t0)
	
HEART:		
	la 	a4, Heart_size
	li 	a6, 569
	li 	a7, 499
				
				
					
							
DROPA_CORACAO:
li t5, -71	#Stance de cora��o				
							
													
ENEMY_NEXT:																																																																																																																											
	#Armazena na pilha temporaria
	#Push()
	addi sp, sp, -4
	sw t1,0(sp)	#armazena y
	addi sp, sp, -4
	sw t2,0(sp)	#armazena x
	addi sp, sp, -4	
	sw s7,0(sp)	#armazena fixo de x
	addi sp, sp, -4	
	sw s5, 0(sp)	#armazena vida
	addi sp, sp, -4
	sw t5,0(sp)	#armazena stance
	ret		
