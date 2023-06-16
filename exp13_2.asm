assume cs:code
code segment
install:
  mov ax,cs
  mov ds,ax
  mov si,offset lp
  mov ax,0
  mov es,ax
  mov di,200h
  mov cx,offset lp_end - offset lp
  cld
  rep movsb
set_vector:
  mov ax,0
  mov es,ax
  mov word ptr es:[7ch*4],200h
  mov word ptr es:[7ch*4+2],0
  mov ax,4c00h
  int 21h
lp:
  push bp
  mov bp,sp
  dec cx
  jcxz lpret
  add [bp+2],bx
lpret:
  pop bp
  iret
lp_end:
  nop
code ends
end install