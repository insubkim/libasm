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

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m

all: $(NAME)

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.s
	@$(ASSEMBLER) -felf64 -o $@ $<
	@echo  "$(COLOUR_BLUE)OBJECT CREATE COMPLETE [$(notdir $@)]$(COLOUR_END)"

$(NAME): $(OBJS)
	@ar -rcs $@ $^
	@echo  "$(COLOUR_BLUE)LIBRARY CREATE COMPLETE [$(NAME)]$(COLOUR_END)"

clean:
	@rm -f $(OBJS) $(BONUS_OBJS)
	@echo  "$(COLOUR_RED)OBJECT REMOVE COMPLETE$(COLOUR_END)"

fclean: clean
	@rm -f $(NAME) 
	@echo  "$(COLOUR_RED)LIB REMOVE COMPLETE$(COLOUR_END)"

re: fclean all

.PHONY: all clean fclean re
