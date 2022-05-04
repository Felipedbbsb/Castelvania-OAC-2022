.data
DIALOGO_STANCE:			.half  0

.text
DIALOGO:
la t4, DIALOGO_STANCE
lh t5, 0(t4)

li t0, 250
bge t0, t5, Chat0
li t0, 500
bge t0, t5, Chat1
li t0, 750
bge t0, t5, Chat3
li t0, 751
bge t0, t5, Chat4

li t0, 1000
bge t0, t5, Chat5
li t0, 1001
bge t0, t5, Chat6
li t0, 1250
bge t0, t5, Chat7
li t0, 1500
bge t0, t5, Chat8
li t0, 1700
bge t0, t5, Chat9
li t0, 1900
bge t0, t5, Chat10
li t0, 1901
bge t0, t5, Chat11
ret


	Chat0:
	li a6, 0
	li a7, 0
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat1:
	li a6, 369
	li a7, 0
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat2:
	li a6, 369
	li a7, 0
	sh zero, 0(t4)
	ret
	
	Chat3:
	li a6, 723
	li a7, 0
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat4:
	li a6, 723
	li a7, 0
	sh zero, 0(t4)
	ret
	
	Chat5:
	li a6, 1093
	li a7, 0
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat6:
	li a6, 1093
	li a7, 0
	la t0, CALICE_NUM
	lb t1, 0(t0)
	li t2, 3
	beq t1, t2 , CONTINUA_CHAT	#Requisito para avançar no dialogo ter pego todos os calices
	sh zero, 0(t4)
	ret
	CONTINUA_CHAT:
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat7:
	li a6, 0
	li a7, 103
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat8:
	li a6, 369
	li a7, 103
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat9:
	li a6, 723
	li a7, 103
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat10:
	li a6, 1093
	li a7, 103
	addi t5, t5, 1
	sh t5, 0(t4)
	ret
	
	Chat11:
	li a6, 1093
	li a7, 103
	li t1, -2
	sh t1, 0(t4)
	ret