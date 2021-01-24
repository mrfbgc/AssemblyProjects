numwor segment
main proc far
assume cs:numwor,ds:numwor,es:numwor

mov ax,0
push ds ax
mov ax,numwor
mov ds,ax
mov es,ax

jmp start
m1 db 10,13,'enter a sentence:$'
m2 db 10,13,'number of word in the sentence:$'
m3 db 10,13,'sentecen that you put:$'
numsize db 1
str1 db 20 dup('$')

start:
mov ah,09h
lea dx,m1
int 21h

lea di,str1
takechar:
mov ah,01h
int 21h

cmp al,13
je finisihtakechar
stosb
inc numsize

cmp al,32
dec numsize

jmp takechar

finisihtakechar:
lea si,str1
mov cl,numsize

mov ah,09h
lea dx,m2
int 21h
Lea di,str1
Read:
Lodsb
Mov ah,02h
Mov dl,al
int 21h
Loop read

int 21h

ret
main endp
numwor ends
end

