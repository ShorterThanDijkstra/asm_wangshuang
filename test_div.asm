assume cs:codesg
codesg segment
start: mov ax,0111111111111111b
       mov bl,1
       div bl
       
       mov ax,4c00h
       int 21h
codesg ends
end start