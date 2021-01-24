save segment
main proc far
assume cs:save, ds:save, es:save

mov ax,0
push ds ax
mov ax,save
mov ds,ax
mov es,ax 

jmp start
m1 db 10,13,'enter a char:$'
stri1 db 10 dup('$')

start:
mov ah,09h
lea dx,m1
int 21h

lea di,stri1

enterstring:
mov ah,01h
int 21h
cmp al,13; check enter or not 
je finish
stosb ;we do not have to sub 30h because these are string data, we need ascii
jmp enterstring

finish:
ret 
main endp
save ends




