assume cs:code,ds:data,ss:table

data segment
    db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'
    dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800
data ends

table segment
    db 21 dup ('year summ ne ?? ')
table ends

code segment
start:
    mov ax,data
    mov ds,ax
    
    mov bx,0e0h
    mov cx,21
    mov di,0
    mov si,0
s0: 
    mov ax,ds:[di]
    mov ds:[bx+si],ax

    mov ax,ds:[di+2]
    mov ds:[bx+si+2],ax
    
    mov ax,ds:[di+84]
    mov ds:[bx+si+5],ax
    
    mov ax,ds:[di+86]
    mov ds:[bx+si+7],ax

    add di,4
    add si,16
    loop s0

    mov bx,0e0h
    mov cx,21
    mov di,0
    mov si,0
s1: mov ax,ds:[di+168]
    mov ds:[bx+si+10],ax
    mov ax,ds:[bx+si+5]
    mov dx,ds:[bx+si+7]
    div word ptr ds:[bx+si+10]
    mov ds:[bx+si+13],ax
    add si,16
    add di,2
    loop s1

    mov ax,4c00h
    int 21h
code ends
end start