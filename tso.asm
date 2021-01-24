subtrac segment
main proc far
assume cs:subtrac,ds:subtrac

mov ax,0
push ds ax
mov ax,subtrac
mov ds,ax

jmp start
m1 db 10,13,'enter the first number:$'
m2 db 10,13,'enter the second number:$'
m3 db 10,13,'result:$'

var db 10

start:
mov bl,0 ;reset bl for move the value of al in the future

mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h
sub al,30h
mov ah,0 ; reset for multiplication
mul var ; with that code we took the tens digit
mov bl,al ; look at the above(line18)

mov ah,01h
int 21h
sub al,30h
add bl,al ;first number is in bl register

mov ah,09h
lea dx,m2
int 21h

mov ah,01h
int 21h
sub al,30h

sub bl,al 

mov ah,09h
lea dx,m3
int 21h

mov ah,02h
mov dl,bl
add dl,30h
int 21h


ret 
main endp
subtrac ends 
end 