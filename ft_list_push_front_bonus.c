
section .text
	global ft_list_push_front_bonus
	extern malloc

ft_list_push_front_bonus:
	; rdi = t_list **begin_list
	; rsi = void *data
	; return: new node in rax (0 or error)

	test rdi, rdi		; check if begin_list is NULL
	jz .error

	push rdi		; save begin_list
	push rsi		; save data

	; allocate memory for new node (sizeof(t_list) = 16 bytes)
	mov rdi, 16
	call malloc

	test rax, rax		; check if malloc failed
	jz .malloc_error

	pop rsi			; restore data
	pop rdi			; restore begin_list

	; Set new node data
	mov [rax], rsi		; new_node->data = data

	; Set new node next
	mov rcx, [rdi]		; rcx = *gebin_list
	mov [rax + 8], rcx	; *begin_list = new_node

	mov [rdi], rax		; *begin_list = new_node
	ret

.malloc_error:
	pop rsi
	pop rdi
.error:
	xor rax, rax
	ret
