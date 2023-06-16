assume cs:code
code segment
  start: 
    mov cx,10
  s:
    int 9
    loop s
  mov ax,4c00h
  int 21h
code ends
end start