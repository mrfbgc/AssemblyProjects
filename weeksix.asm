bigger segment
main proc far
assume cs:bigger, ds:bigger

mov ax,0
push ds ax
mov ax,bigger
mov ds,ax

jmp start
m1 db 10,13,'enter a number:$'
m2 db 10,13,'number of greater than three:$'

start:
mov cl,10
mov bl,0

takenumber:
mov ah,09h
lea dx,m1 
int 21h

mov ah,01h
int 21h
sub al,30h

cmp al,3

jg greater
jmp finish

greater:
add bl,1
finish:
loop takenumber

printscreen:
mov ah,09h
lea dx,m2
int 21h

mov ah,02h
mov dl,bl
add dl,30h
int 21h
ret
main endp
bigger ends
end
