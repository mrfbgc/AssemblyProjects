oddd segment
main proc far
assume cs:oddd, ds:oddd

mov ax,0
push ds ax
mov ax,oddd
mov ds,ax

jmp start
m1 db 10,13,'enter a number:$'
m2 db 10,13,'number of odd number:$'
counter db 0 
start:
mov cl,25 ; we want to take 25 numbers from user

takenumber:
mov ah,09h
lea dx,m1
int 21h

mov ah,01h
sub al,30h
int 21h

mov ah,0 ; we have to reset ah because there is a 01h function inside it.
mov bl,2
div bl

cmp ah,0

jne odd 

jmp finish1

odd:
add counter,1
finish1: loop takenumber

printscreen:
mov ah,09h
lea dx,m2
int 21h

mov ah,02h
mov dl,counter 
add dl,30h
int 21h

ret
main endp
oddd ends
end
