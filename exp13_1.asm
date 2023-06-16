assume cs:code
code segment
; dh=line number, dl=column number, cl=color, ds:si=string start
start:
install:
  mov ax,cs
  mov ds,ax
  mov si,offset display
  mov ax,0
  mov es,ax
  mov di,200h
  mov cx,offset display_end - offset display
  cld
  rep movsb
set_vector:
  mov ax,0
  mov es,ax
  mov word ptr es:[7ch*4],200h
  mov word ptr es:[7ch*4+2],0

  mov ax,4c00h
  int 21h
display:
  push ax
  push es
  push di
  push si
  mov ax,0b800h
  mov es,ax
  mov al,160
  mul dh
  mov di,ax
  mov al,2
  mul dl
  add di,ax
copy:
  mov al,ds:[si]
  cmp al,0
  je ok
  mov es:[di],al
  inc di
  mov es:[di],cl
  inc di
  inc si
  jmp short copy
ok:
  pop si
  pop di
  pop es
  pop ax
  iret
display_end:
  nop
code ends
end start