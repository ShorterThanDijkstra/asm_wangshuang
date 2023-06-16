assume cs:code,ds:data
data segment
  db 77h, 2h, 65h, 2h, 6ch, 2h, 63h, 2h, 6fh, 2h, 6dh, 2h, 65h, 2h, 20h, 2h, 74h, 2h, 6fh, 2h, 20h, 2h, 6dh, 2h, 61h, 2h, 73h, 2h, 6dh, 2h, 21h, 2h
  db 77h, 24h, 65h, 24h, 6ch, 24h, 63h, 24h, 6fh, 24h, 6dh, 24h, 65h, 24h, 20h, 24h, 74h, 24h, 6fh, 24h, 20h, 24h, 6dh, 24h, 61h, 24h, 73h, 24h, 6dh, 24h, 21h, 24h
  db 77h, 71h, 65h, 71h, 6ch, 71h, 63h, 71h, 6fh, 71h, 6dh, 71h, 65h, 71h, 20h, 71h, 74h, 71h, 6fh, 71h, 20h, 71h, 6dh, 71h, 61h, 71h, 73h, 71h, 6dh, 71h, 21h, 71h
data ends
code segment
start:  mov ax,data
        mov ds,ax
        mov bx,0
        
        mov ax,0b8b4h
        mov es,ax

        mov cx,60h
        
s:      mov al,ds:[bx]
        mov es:[bx],al
        inc bx
        loop s
        mov ax,4c00h
        int 21h
code ends
end start