# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gchinaul <gchinaul@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/03 12:28:44 by gchinaul          #+#    #+#              #
#    Updated: 2025/09/03 13:14:06 by gchinaul         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
TEST = test_libasm

NASM = nasm
NASMFLAGS = -f elf64

CC = gcc
CFLAGS = -Wall -Wextra -Werror

AR = ar
ARFLAGS = rcs

ASM_SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
ASM_BONUS_SRCS = ft_atoi_base_bonus.s ft_list_push_front_bonus.s ft_list_size_bonus.s \
				ft_list_sort_bonus.s ft_list_remove_if_bonus.s

ASM_OBJS = $(ASM_SRCS:.s=.o)
ASM_BONUS_OBJS = $(ASM_BONUS_SRCS:.s=.o)

HEADER = libasm.h

TEST_SRCS = main.c
TEST_OBJS = $(TEST_SRCS:.c=.o)

RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
PURPLE = \033[0;35m
CYAN = \033[0;36m
WHITE = \033[0;37m
RESET = \033[0m

all: $(NAME)

$(NAME): $(ASM_OBJS)
	@echo "$(CYAN) let's go $(RESET)"
	$(AR) $(ARFLAGS) $(NAME) $(ASM_OBJS)
	@echo "$(GREEN) $(NAME) ready $(RESET)"

bonus: $(ASM_OBJS) $(ASM_BONUS_OBJS)
	@echo "$(CYAN) let's go bonus $(RESET)"
	$(AR) $(ARFLAGS) $(NAME) $(ASM_OBJS) $(ASM_BONUS_OBJS)
	@echo "$(GREEN) $(NAME) bonus ready $(RESET)"

%.o: %.s
	@echo "$(YELLOW) compile petit con $<... $(RESET)"
	$(NASM) $(NASMFLAGS) $< -o $@

$(TEST): $(NAME) $(TEST_OBJS)
	@echo "$(CYAN) test ? ok !...$(RESET)"
	$(CC) $(CFLAGS) $(TEST_OBJS) -L. -lasm -o $(TEST)
	@echo "$(GREEN) test ready $(RESET)"

test: $(TEST)
	@echo "$(PURPLE) test start for fun $(RESET)"
	./$(TEST)

clean:
	@echo "$(RED) clean $(RESET)"
	rm -f $(ASM_OBJS) $(ASM_BONUS_OBJS) $(TEST_OBJS)

fclean: clean
	@echo "$(RED) big clean $(RESET)"
	rm -f $(NAME) $(TEST)

re: fclean all

.PHONY: all clean fclean bonus re test