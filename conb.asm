conb segment
main proc far
assume cs:conb,ds:conb

xor ax,ax
push ds ax
mov ax,conb
mov ds,ax

jmp start

message1 db 10,13,'enter a number:$'
message2 db 10,13,'number in binary:$'
multen db 10
vari1 db 0

start:
mov ah,09h
lea dx,message1
int 21h

mov ah,01h
int 21h
sub al,30h

mov ah,0
mul multen
mov bl,al


mov ah,01h
int 21h
sub al,30h

add al,bl

mov ah,09h
lea dx,message2
int 21h

mov cl,8
convert:
shl al,1
jc one

mov ah,02h
mov dl,'0'
int 21h
jmp finish1

one:
mov ah,02h
mov dl,'1'
int 21h

finish1:
loop convert

ret
main endp
conb ends
end

