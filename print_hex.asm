; 
; print hexdecimal value
; 
print_hex:
    pusha
    mov cx, 0 ; set counter to 0
hex_loop:
    cmp cx, 4 ; if counter is less than 4, then loop
    je end_loop ; if counter is 4, then jump to end_loop

    mov ax, dx ; set ax to dx
    and ax, 0x000F ; mask ax to get the last 4 bits
    add al, 0x39 ; if al is greater than 0x39, then jump to hex_loop
    cmp al, 0x39 ; if al is greater than 0x39, then jump to hex_loop
    jle move_intoBX
    add al, 0x7 ; if al is less than 0x39, then add 7 to al

move_intoBX:
    mov bx, HexString + 5
    sub bx, cx
    mov [bx], al
    ror dx, 4 ; rotate dx by 4 bits

    add cx,1
    jmp hex_loop

end_loop:
    mov bx, HexString
    call print_string
    popa
    ret

    ; data
HexString: db '0x0000', 0