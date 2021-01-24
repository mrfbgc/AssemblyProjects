change segment
main proc far
assume cs:change,ds:change

mov ax,0
push ds ax
mov ax,change
mov ds,ax

jmp start

message1 db 10,13,'value of al:$'
message2 db 10,13,'value of bl:$'

start:
mov al,5 
mov bl,7
XCHG al,bl

mov ah,09h
mov dx,offset message1
int 21h

mov ah,02h
mov dl,al
int 21h

mov ah,09h
mov dx,offset message2
int 21h 

mov ah,02h
mov dl,bl
int 21h

ret
main endp
change ends
end
