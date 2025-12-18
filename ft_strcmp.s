https://medium.com/@leogaudin/libasm-a-guide-to-get-familiar-with-assembly-in-42-830f619f4c5e

section .text
    global ft_strcmp

ft_strcmp:
    ; rdi = const char *s1
    ; rsi = const char *s2
    ; return value in rax

xor rax, rax ; rax = 0 (index)

.loop:
    mov cl, byte [rdi + rax] ; load char from s1
    mov dl, byte [rsi + rax] ; load char from s2

    cmp cl,dl ; compare characters
    jne .diff ; if different, go to diff

    test cl, cl ; check if reached end of string
    jz .diff ; if '\0', strings are equal

    inc rax ; increment index
    jmp .loop ; continue loop

.diff:
    movzx rax, cl ; zero-extend cl to rax
    movzx rdx, dl ; zero-extend dl to rdx
    sub rax, rdx ; rax = s1[i] - s2[i]
    ret

.equal:
    xor rax, rax ; return 0
    ret
