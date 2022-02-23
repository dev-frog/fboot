; fBoot Secotor
    org 0x7c00 ; 'origin' of boot code, in sectors

    mov ah, 0x0e ; int 10/ ah 0x0e  ; fBoot Secotor
    mov bx, String
    jmp print_string


print_string:
    mov al, [bx]
    cmp al, 0
    je done          ; jump if al == 0
    int 0x10
    add bx, 1
    jmp print_string
String: db 'F', 'B', '0', '0', 'T', 0

done:
    jmp $
    times 510-($-$$) db 0 ;pads out 0s until we reach the 510th byte
    dw 0xaa55 ;signature bois magic number
