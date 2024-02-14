[org 0x7c00]                    ; tells the assembler where the code will be loaded (default is 0x7c00?)

mov ah, 0x0e                    ; set up registers for the BIOS interrupt,
                                ; 0x0e in ah is for teletype output

mov al, 'H'                     ; character to print
int 0x10                        ; call the BIOS interrupt
                                ; repeat for hello world
mov al, 'e'
int 0x10

mov al, 'l'
int 0x10

mov al, 'l'
int 0x10

mov al, 'o'
int 0x10

mov al, ','
int 0x10

mov al, ' '
int 0x10

mov al, 'W'
int 0x10

mov al, 'o'
int 0x10

mov al, 'r'
int 0x10

mov al, 'l'
int 0x10

mov al, 'd'
int 0x10

mov al, '!'
int 0x10

jmp $                           ; jump to current address, effectively an infinite loop
                                ; this is necessary because the CPU/BIOS is trigger happy
                                ; and will keep executing whatever is in memory after the
                                ; bootloader if we don't tell it to stop

; pad out the rest of the sector with 0s
times 510-($-$$) db 0

; magic number at the end of the bootloader to indicate that it is bootable
dw 0xAA55
