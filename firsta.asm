control segment
main proc far
assume cs:control,ds:control

mov ax,0
push ds ax
mov ax,control
mov ds,ax

jmp start

message1 db 10,13,'enter your string:$'
message2 db 10,13,'string contains a$'
message3 db 10,13,'string does not contain a$'
string1 db 50 DUP('$')

start:
mov ah,09h
mov dx,offset message1
int 21h

mov ah,0Ah
mov dx,offset string1
int 21h

mov bx,offset string1
mov al,0
XLAT

cmp al,'a'

je yes
mov ah,09h
mov dx,offset message3
int 21h

jmp finish
yes:
mov ah,09h 
mov dx,offset message2
int 21h

finish:
ret
main endp
control ends
end