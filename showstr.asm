assume cs:code
code segment
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

  mov ax,4c00h
  int 21h
code ends
end handle