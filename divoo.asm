divi segment 
main proc far
assume cs:divi, ds:divi

mov ax,0
push ds ax
mov ax,divi
mov ds,ax

jmp start

m1 db 10,13,'enter the first number:$'
m2 db 10,13,'enter the second number:$'
m3 db 10,13,'result:$'
m4 db 10,13,'residual:$'

start:
mov bl,0
mov cl,0

mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h
sub al,30h
mov cl,al
; dividend is in cl


mov ah,09h
lea dx,m2
int 21h

mov ah,01h
int 21h
sub al,30h 
;divisor is in bl 

mov al,cl
mov ah,0 ;we have to reset ah to correct operation
DIV bl

mov ah,09h
lea dx,m3
int 21h

mov ah,02h
mov dl,al
add dl,30h
int 21h

mov ah,09h
lea dx,m4
int 21h

mov ah,02h
mov dl,ah
add dl,30h
int 21h

ret
main endp
divi ends 
end