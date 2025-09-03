https://medium.com/@leogaudin/libasm-a-guide-to-get-familiar-with-assembly-in-42-830f619f4c5e

section .text
    global ft_write
    extern _errno_location

ft_write:
    ; rdi = int fildes
    ; rsi = const void *buf
    ; rdx = size_t nbyte
    ; return value in rax

mov rax, 1 ; syscall number for write
syscall ; call kernel

cmp rax, 0 ; checkif error occured
jl .error ; if negative, handle error
ret ; return success value

.error:
    neg rax ; make error code positive
    push rax ; save error code
    call _errno_location ; get address of errno
    pop rdx ; restore error code
    mov [rax], rdx ; set errno
    mov rax, -1 ; return -1
    ret
