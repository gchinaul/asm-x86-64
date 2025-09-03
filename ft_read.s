https://medium.com/@leogaudin/libasm-a-guide-to-get-familiar-with-assembly-in-42-830f619f4c5e

section .text
    global ft_read
    extern _errno_location

ft_read:
    ; rdi = int fildes
    ; rsi = void *buf
    ; rdx = size_t nbyte
    ; return value in rax

mov rax,0 ;syscall number for read
syscall

cmp rax,0 ; check if error occured
jl .error ; if negative, handle error
ret     ;return success value

.error:
    neg rax ;make error code positive
    push rax ; save error code
    call _errno_location ; get address of errno
    pop rdx ; restore error code
    mov [rax], rdx ; set errno
    mov rax, -1 ; return -1
    ret
