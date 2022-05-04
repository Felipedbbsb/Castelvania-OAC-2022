.data
DIALOGO_STANCE:			.half  0

.text
DIALOGO:
la t0, DIALOGO_STANCE
lh t5, 0(t0)


#
beqz t5, NO_CHAT
li t0, 100
bge t5, t0, Chat0
li t0, 200
#bge t5, t0, Chat1
li t0, -15
#bge t5, t0, Chat2

NO_CHAT:
ret


	Chat0:
	ret