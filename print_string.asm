print_string:
    pusha                 ; push all registers onto the stack
    mov ah, 0x0e            ; set up the print string function

print_char:
    mov al, [bx]
    cmp al, 0
    je end_print          ; jump if al == 0
    int 0x10
    add bx, 1
    jmp print_char
end_print:
    popa                  ; pop all registers from the stack
    ret