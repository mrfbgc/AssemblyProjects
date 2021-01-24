oddeven segment
main proc far 
assume cs:oddeven,ds:oddeven

xor ax,ax
push ds ax
mov ax,oddeven
mov ds,ax

jmp start

message1 db 10,13,'enter a number:$'
message2 db 10,13,'number is odd$'
message3 db 10,13,'number is even$'
tenmul db 10
vari1 db ?

start:
mov ah,09h
lea dx,message1
int 21h

mov ah,01h
int 21h
sub al,30h
mov vari1,al

mov ax,0
mov ah,01h
int 21h
sub al,30h
mov bl,al

mov ax,0

mov al,vari1
mul tenmul

add al,bl 

shift:
shr al,1
jc odd
mov ah,09h
lea dx,message3
int 21h
jmp finish

odd:
mov ah,09h
lea dx,message2
int 21h

finish:
ret
main endp
oddeven ends
end







