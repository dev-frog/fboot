; fBoot Secotor

jump:
    jmp jump
    times 510-($-$$) db 0 ;pads out 0s until we reach the 510th byte
    dw 0xaa55 ;signature bois magic number
