NAME	=	Colleen

SRC		=	Colleen.c

CC		=	clang

OBJ	=	$(SRC:.c=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

%.o:		%.c
	$(CC) $(CFLAGS) $< -o $@ -c


clean:
			rm -rf $(OBJ)

fclean:		clean
			rm -rf $(NAME)
			
re:			fclean
			$(MAKE) all

test:		$(NAME)
			@cat	$(SRC)
			./$(NAME)

diff:		$(NAME)
			./$(NAME) > output.txt
			diff -s $(SRC) output.txt

.PHONY: all, clean, fclean, re, test, diff



