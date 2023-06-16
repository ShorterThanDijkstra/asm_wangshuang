assume cs:codesg,ds:datasg
datasg segment
   db 'ibm             '
   db 'dec             '
   db 'dos             '
   db 'vax             '
datasg ends
codesg segment
start:  mov ax,datasg
        mov ds,ax
        mov bx,0
        
        mov cx,4
s:      mov al,ds:[bx]
        add al,11101111b
        mov ds:[bx],al

        mov al,ds:[bx+1]
        add al,11101111b
        mov ds:[bx+1],al

        mov al,ds:[bx+2]
        add al,11101111b
        mov ds:[bx+2],al

	add bx, 16
        loop s

        mov ax,4c00h
        int 21h
codesg ends
end start
codesg ends
end start