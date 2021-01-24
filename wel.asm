yaz segment
ana proc far
assume cs:yaz, ds:yaz
mov ax,0
push ds ax
mov ax,yaz
mov ds,ax 
;10 satır başı 13 enter
mesaj db 10,13,'Merhaba$'

mov ah,09h
mov dx,offset mesaj
int 21h

ret

ana endp
yaz ends
end