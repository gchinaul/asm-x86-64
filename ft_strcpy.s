https://medium.com/@leogaudin/libasm-a-guide-to-get-familiar-with-assembly-in-42-830f619f4c5e

section .text
    global ft_strcpy

ft_strcpy:
    ; rdi = char *dst
    ; rsi = const char *src
    ; return value in rax

mov rax, rdi ; save dst in rax for return
xor rcx, rcx ; rcx = 0 (index)

test rdi, rdi ; check if dst is NULL
jz  .done ; if NULL, return NULL
test rsi, rsi ; check if src is NULL
jz  .done ; if NULL, return dst

.loop:
    mov dl, byte[rsi + rcx] ; load current char from src
    mov byte[rdi + rcx], dl ; store char in dst
    test dl, dl ; check if char '\0'
    jz  .done ; if '\0', we're done
    inc rcx ; increment index
    jmp .loop ; continue loop

.done:
    ret ; return rax (dst)
