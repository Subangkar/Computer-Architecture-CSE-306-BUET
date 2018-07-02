add s1, s2, s0
addi s3, s5, 7
sub s3, s2, s7
subi s2, s5, 10
and s1, s2, s3
andi s1, s2, s0
or s1, s2, s3
ori s1, s2, 0
add s4, s1, 0
sw s4, 5(s3)
lw s6, 5(s3)
beq s4, s6, 10
j 7 