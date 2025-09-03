; https://www.youtube.com/watch?v=wFvxw7v-lg0

section .text
    global ft_strlen

ft_strlen:
    ; rdi = const char *s
    ; return value in rax

xor rax, rax    ; rax = 0 (counter)

test rdi, rdi   ; check if s is null
jz .done        ;if null return 0

.loop:
    cmp byte [rdi + rax], 0 ;compare current char with '\0'
    je  .done   ; if '\0' are done
    inc rax     ; increment counter
    jmp .loop   ; continue loop

.done:
    ret     ;return rax length