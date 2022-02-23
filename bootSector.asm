; fBoot Secotor
    org 0x7c00 ; 'origin' of boot code, in sectors

    mov ah, 0x0e ; int 10/ ah 0x0e  ; fBoot Secotor
    mov bx, String
    mov al, [bx] ;  memory address of string
    int 0x10

    mov al, [bx+1] ;  memory address of string
    int 0x10
    add bx,2    ;  increment string pointer
    mov al, [bx] ;  memory address of string
    int 0x10


String: db 'F', 'B', '0', '0', 'T', 0

    jmp $
    times 510-($-$$) db 0 ;pads out 0s until we reach the 510th byte
    dw 0xaa55 ;signature bois magic number
