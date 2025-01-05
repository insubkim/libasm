# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: inskim <inskim@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/08 17:45:42 by inskim            #+#    #+#              #
#    Updated: 2022/08/14 19:55:13 by inskim           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

ASSEMBLER = nasm

SRCS_DIR = src
SRCS = $(shell find $(SRCS_DIR) -name "*.s")

OBJS_DIR = obj
OBJS = $(subst $(SRCS_DIR)/, $(OBJS_DIR)/, $(SRCS:.s=.o))

all: $(NAME)

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.s
	$(ASSEMBLER) -felf64 -o $@ $<

$(NAME): $(OBJS)
	ar -rcs $@ $^

clean:
	rm -f $(OBJS) $(BONUS_OBJS)

fclean: clean
	rm -f $(NAME) 

re: fclean all

.PHONY: all clean fclean re bonus