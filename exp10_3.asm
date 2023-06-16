assume cs:code

data segment
  db 10 dup (0)
data ends
code segment
  start:
  mov ax,12666
  mov bx,data
  mov ds,bx
  mov si,0
  call dtoc

  mov dh,8
  mov dl,3
  mov cl,2
  call show_str

  mov ax,4c00h
  int 21h
dtoc:
  push di
  push si
  push ax
  push bx
  push cx
  push dx

dtoc_change:
  mov dx,0
  mov bx,10
  div bx
  add dx,30h
  push dx
  mov cx,ax
  inc di
  jcxz dtoc_reverse_pre
  jmp short dtoc_change
dtoc_reverse_pre:
  mov cx,di
dtoc_reverse:
  pop bx
  mov ds:[si],bl
  inc si
  loop dtoc_reverse
dtoc_ok:
  mov byte ptr ds:[si],0
  pop dx
  pop cx
  pop bx
  pop ax
  pop si
  pop di
  ret
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

change_str:
   mov al,ds:[si]

   mov ah,cl
   mov cl,al
   mov ch,0
   jcxz ok_show_str
   mov cl,ah       

   mov es:[bx],al
   inc bx
   mov es:[bx],cl
   inc si
   inc bx
   jmp short change_str
ok_show_str:    
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