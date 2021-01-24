dizi segment
ana proc far
assume cs:dizi, ds:dizi

mov ax,0
push ds,ax
mov ax,dizi
mov ds,ax

jmp basla
mesaj1 db 10,13,'string giriniz:$'
mesaj2 db 10,13,'istediginiz karakter:$'
dizi db 50 DUP('$')

basla:
mov ah,09h
mov dx,offset mesaj1
int 21h

mov ah,0Ah
mov dx,offset dizi
int 21h

mov bx,offset dizi
mov al,5
XLAT

mov ah,09h
mov dx,offset mesaj2
int 21h

mov ah,02h
mox dl,al
int 21h
ret

ana endp
dizi ends
end


