assume cs:codesg
datasg segment
  db "Beginner's All purpose Symbolic Instruction Code.",0
datasg ends

codesg segment
  begin: 
  mov ax,datasg
  mov ds,ax
  mov si,0
  call letterc
  
  mov ax,4c00h
  int 21h

  letterc:
  push ax
  push si
  mov ax,0
  letterc_up:
  mov al,ds:[si]
  cmp al,0
  je break
  cmp al,61h
  jb continue
  cmp al,7ah
  ja continue
  and al,11011111b
  mov ds:[si],al
  continue:
  inc si
  jmp short letterc_up

  break:
  pop si
  pop ax
  ret
  
codesg ends
end begin