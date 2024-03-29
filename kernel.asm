;;kernel.asm
bits 32               ;nasm directive - 32 bit
section .txt
        ;multiboot spec
        align 4
        dd 0x1BADB002   ;magic
        dd 0x00         ;flags
        dd - (0x1BADB002 + 0x00) ;checksum. m + f + c should be zero

global start 
extern kmain          ;kmain is defined in the c file

start:
    cli                   ;block interrrupts
    mov esp , stack_space ;set stack pointer
    call kmain
    hlt                   ;halt the cpu
section .bss
resb 8192                 ;8kb for stack
stack_space: