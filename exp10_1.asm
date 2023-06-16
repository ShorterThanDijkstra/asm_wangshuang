assume cs:code
data segment
  db 'Welcome to masm!', 0
data ends
code segment
start: mov dh,8
       mov dl,3
       mov cl,2
       mov ax,data
       mov ds,ax
       mov si,0
       call show_str

       mov ax,4c00h
       int 21h
show_str:
       push ax
       push bx
       push cx
       push dx
       push ds
       push es
       push si

       mov al, 0ah
       mul dh
       add ax,0b800h
       mov es,ax
       
       mov ax,2
       mul dl
       mov bx,ax
       mov bh,0

change:
       mov al,ds:[si]

       mov ah,cl
       mov cl,al
       mov ch,0
       jcxz ok
       mov cl,ah       

       mov es:[bx],al
       inc bx
       mov es:[bx],cl
       inc si
       inc bx
       jmp short change
ok:    
       pop si
       pop es
       pop ds
       pop dx
       pop cx
       pop bx
       pop ax
       ret
code ends
end start