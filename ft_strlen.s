; https://www.youtube.com/watch?v=wFvxw7v-lg0
; nasm -f elf64 -o ft_strlen.o ft_strlen.s
; gcc -c main.c
; gcc main.o ft_strlen.o -o test_prog

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
    inc rax     ; increment counter (rax = 1)
    jmp .loop   ; continue loop

.done:
    ret     ;return rax length
