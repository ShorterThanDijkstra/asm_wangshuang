assume cs:code
code segment
start:
install:
  mov ax,cs
  mov ds,ax
  mov si,offset handle
  mov ax,0
  mov es,ax
  mov di,200h
  mov cx,offset handle_end - offset handle
  cld
  rep movsb

set_int:
  mov ax,0
  mov es,ax
  mov word ptr es:[0],200h
  mov word ptr es:[2],0
  
  int 0
  ;mov ax,1
  ;mov bx,0
  ;div bx
  mov ax,4c00h
  int 21h

handle:
  jmp short handle_start
  db "I LOVE YOU!"
handle_start:
  mov ax,cs
  mov ds,ax
  mov si,offset handle_start - 11
  
  mov ax,0b800h
  mov es,ax
  mov di,12*160

  mov cx,11
copy_str:
  mov al,ds:[si]
  mov es:[di],al
  inc di
  mov byte ptr es:[di],0cah
  inc si
  inc di
  loop copy_str

  iret
handle_end:
  nop
code ends
end start