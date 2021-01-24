oddadd segment
main proc far
assume cs:oddadd,ds:oddadd

xor ax,ax
push ds ax
mov ax,oddadd
mov ds,ax

jmp start
message1 db 10,13,'enter a number:$'
message2 db 10,13,'result of addiction of the odd numbers:$'
rslt db 0
ten db 10

start:
mov cl,10
takenumber:
mov ah,09h
lea dx,message1
int 21h

mov ah,01h
int 21h
sub al,30h

control_0: ;control for greater end equal than 0
cmp al,0
jge control_9
jmp loops

control_9: ;control for less and equal than 9
cmp al,9
jle control_odd

loops:
loop takenumber
jmp print

control_odd:
test al,1
jz loops

add_odds:
add rslt,al
jmp loops

print:
mov ah,09h
lea dx,message2
int 21h

mov ax,0
mov al,rslt
div ten
mov bx,ax
;bl bölüm bh kalan
; bl onlar bh birler basamağı yani

mov ah,02h
mov dl,bl
add dl,30h
int 21h

mov ah,02h
mov dl,bh
add dl,30h
int 21h

ret 
main endp
oddadd ends
end

