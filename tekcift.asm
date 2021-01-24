odpa segment
main proc far
assume cs:odpa, ds:odpa

mov ax,0
push ds ax
mov ax,odpa
mov ds,ax

jmp start
m1 db 10,13,'enter a number:$'
m2 db 10,13,'number is odd$'
m3 db 10,13,'number is even$'

start:
mov ah,09h
lea dx,m1
int 21h

mov ah,01h
int 21h
sub al,30h

mov ah,0
mov bl,2
div bl 

cmp ah,0
je evenn 

mov ah,09h
lea dx,m2
int 21h 
jmp finish

evenn:

mov ah,09h
lea dx,m3
int 21h

finish:
ret 
main endp 
odpa ends
end 