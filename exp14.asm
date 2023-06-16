assume cs:code
code segment
start:
  mov dl,9
  mov di,30
  call show_time
  add di,4
  
  call show_slash
  add di,2  

  mov dl,8
  call show_time
  add di,4

  call show_slash
  add di,2  

  mov dl,7
  call show_time
  add di,4
  
  call show_space
  add di,2

  mov dl,4
  call show_time
  add di,4

  call show_colon
  add di,2

  mov dl,2
  call show_time
  add di,4

  call show_colon
  add di,2

  mov dl,1
  call show_time
  add di,4

inf_loop:
  nop
  jmp short inf_loop

  mov ax,4c00h
  int 21h
show_slash:
  mov bx,0b800h
  mov es,bx
  mov byte ptr es:[160*12+di],2fh
  mov byte ptr es:[160*12+di+1],0cah
  ret

show_space:
  mov bx,0b800h
  mov es,bx
  mov byte ptr es:[160*12+di],20h
  mov byte ptr es:[160*12+di+1],0cah
  ret
show_colon:
  mov bx,0b800h
  mov es,bx
  mov byte ptr es:[160*12+di],3ah
  mov byte ptr es:[160*12+di+1],0cah
  ret
show_time: ;dl=index,di=colum
  push ax
  push bx
  push cx
  push es
  push di
  
  mov al,dl
  out 70h,al
  in al,71h
  
  mov ah,al
  mov cl,4
  shr ah,cl
  and al,00001111b
  
  add ah,30h
  add al,30h

  mov bx,0b800h
  mov es,bx
  mov byte ptr es:[160*12+di],ah
  mov byte ptr es:[160*12+di+1],0cah
  mov byte ptr es:[160*12+di+2],al
  mov byte ptr es:[160*12+di+3],0cah

  pop di
  pop es
  pop cx
  pop bx
  pop ax
  ret

code ends
end start