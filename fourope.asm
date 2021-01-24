 opera segment
 main proc far
 assume cs:opera, ds:opera
 
 mov ax,0
 push ds ax
 mov ax,opera
 mov ds,ax
 
 jmp start
m1 db 10,13,'enter first number:$'
m2 db 10,13,'enter second number:$'
m3 db 10,13,'1)+ 2)- 3)* 4)/ ---- operation:$'
m4 db 10,13,'result:$'
n1 db ?
n2 db ?

 start:
 mov ah,09h
 lea dx,m1
 int 21h
 
 mov ah,01h
 int 21h
 sub al,30h  
 ;for taking first number and first number is in n1
 mov n1,al


 mov ah,09h
 lea dx,m2
 int 21h
 
 mov ah,01h
 int 21h
 sub al,30h;for taking second number and second number is in dl
 mov n2,al

 
 
 mov ah,09h
 lea dx,m3
 int 21h
 
 mov ah,01h
 int 21h
 sub al,30h
 
 cmp al,1
 je addition 
 
 addition:
 mov al,n1
 add al,n2
 
 mov ah,09h
 lea dx,m4
 int 21h

 mov ah,02h
 Mov dl,al
 Add dl,30h
 int 21h
 
 jmp finish
 
 
 finish:
 ret
 main endp 
 opera ends
 end
 
 
 
 