 tapr segment
 main proc far
 assume cs:tapr,ds:tapr,es:tapr
 
 mov ax,0
 push ds ax
 mov ax,tapr
 mov ds,ax
 mov es,ax
 
 jmp start
 m1 db 10,13,'enter a char:$'
 stri1 db 10 dup('$')
 m2 db 10,13,'your string:$'
 m3 db 10,13,'size of string:$'
 sizee db ?
 
 start:
 mov ah,09h
 lea dx,m1
 int 21h
 
 lea di,stri1
 takechar:
 mov ah,01h
 int 21h
 
 cmp al,13
 je printchar
 
 stosb
 inc sizee
 jmp takechar
 
 printchar:
 lea si,stri1
 mov cl,sizee
 
 mov ah,09h
 lea dx,m2
 int 21h
 
 gotostr:
 lodsb
 mov ah,02h
 mov dl,al
 int 21h
 
 loop gotostr

 ret
 main endp
 tapr ends
 end
 
 
 
 
 