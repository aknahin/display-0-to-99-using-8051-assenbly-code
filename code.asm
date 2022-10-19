org 00h
mov dptr,#mydata

start: 
	mov r1,#00d
display1:
	mov r0,#00d
display:
	acall show
	inc r0
	cjne r0,#10d,display
	inc r1
	cjne r1,#10d,display1
	sjmp start
	
show:	
	mov a,r0
	movc a,@a+dptr
	swap a
	mov r3,a
	mov a,r1
	movc a,@a+dptr
	orl a,r3
	swap a
	mov p1,a
	
delay:
	mov r2,100
	again2: mov r3,100
	again1: djnz r3,again1
	djnz r2,again2
	ret
	
org 300h
mydata: db 0h,1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h, 9h
end