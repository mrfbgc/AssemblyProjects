counta segment
main proc far
assume cs:counta, ds:counta

mov ax,0
push ds ax
mov ax,counta
mov ds,ax

jmp start

m1 db 10,13,'enter a string:$'
m2 db 10,13,'number of a:$'
string1 db 30 DUP('$')
counter db 30
pcs db 0

start:
mov ah,09h
lea dx,m1
int 21h

mov ah,0Ah
mov dx,offset string1
int 21h

start_two:
mov cl,counter

find_a:
mov bx,offset string1
mov al,cl
XLAT

cmp al,'a'
je is
jne not1

not1:
jmp finishloop
is:
add pcs,1 ; use pcs for counting

finishloop:
loop find_a

printscreen:
mov ah,09h
mov dx,offset m2
int 21h

mov ah,02h
mov dl,pcs
add dl,30h
int 21h

ret
main endp
counta ends
end



