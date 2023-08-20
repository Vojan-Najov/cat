NAME = s21_cat

INCLUDES = include/s21_cat.h

SRC = src/s21_cat.c src/s21_cat_utils.c

OBJ = $(SRC:.c=.o)

CC = gcc

CFLAGS = -Wall -Wextra -Werror -std=c11 -Wpedantic -Iinclude/

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $^ -o $@

test: $(NAME)
	bash ./tests/start_test.sh -i

%.o: %.c $(SRC) $(INCLUDES)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
