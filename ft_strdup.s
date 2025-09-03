
section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy
    extern _errno_location

ft_strdup:
    ; rdi = const char *s1
    ; return value in rax

test rdi, rdi ; cehck if s1 is NULL
jz  .error

push rdi ; save s1
call ft_strlen ; get length of s1
inc rax ; add 1 for '\0'
mov rdi, rax ; size for malloc
call malloc

test rax, rax ; check if malloc failed
jz  .error ; if failed, return NULL

pop rsi ; restore s1 (src)
mov rdi, rax ; dst = allocated memory
push rax ; save allocated memory
call ft_strcpy ; copy string
pop rax ; restore allocated memory
ret ; return allocated memory

.error:
    mov rax,0 ; return NULL
    ret