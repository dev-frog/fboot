; fBoot Secotor
    org 0x7c00 ; 'origin' of boot code, in sectors

    mov ah, 0x00 ; 'read' set video mode
    mov al, 0x03 ; 'text' mode
    int 0x10 ; set video mode

    ; change color
    mov ah, 0x0B
    mov bh, 0x00
    mov bl, 0x01
    int 0x10

    mov ah, 0x0e ; int 10/ ah 0x0e  ; fBoot Secotor
    mov bx, String
    call print_string
    mov bx, String2
    call print_string
    jmp done


print_string:
    mov al, [bx]
    cmp al, 0
    je end_print          ; jump if al == 0
    int 0x10
    add bx, 1
    jmp print_string
end_print:
    ret

String: db 'F', 'B', '0', '0', 'T', 0xa, 0xd, 0
String2: db 'd', 'e', 'v', '-', 'f', 'r', 'o', 'g', 0xa, 0xd, 0

done:
    jmp $
    times 510-($-$$) db 0 ;pads out 0s until we reach the 510th byte
    dw 0xaa55 ;signature bois magic number
