assume cs:code
code segment
start:
  mov ax,78h
  call p1
  mov ax,4c00h
  int 21h
p1:
  push bx
  push cx
  mov bx,ax
  shl ax,1
  mov cl,3
  shl bx,cl
  add ax,bx
  pop cx
  pop bx
  ret
code ends
end start