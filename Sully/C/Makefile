NAME	=	Sully

SRC		=	Sully.c

CC		=	clang
CFLAGS	=	-Wall -Wextra -Werror

OBJ	=	$(SRC:.c=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

%.o:		%.c
	$(CC) $(CFLAGS) $< -o $@ -c


clean:
			rm -rf $(OBJ)
			rm -rf Sully?.c

fclean:		clean
			rm -rf $(NAME)
			
re:			fclean
			$(MAKE) all

test:		$(NAME)
			./$(NAME)
			@ls
			@cat Sully5.c
			@cat Sully4.c
			@cat Sully3.c
			@cat Sully2.c
			@cat Sully1.c
	
vtest:		$(NAME)
			valgrind ./$(NAME)

diff:		$(NAME)
			./$(NAME)
			-diff -y $(SRC) Sully5.c
			-diff -y $(SRC) Sully4.c
			-diff -y $(SRC) Sully3.c
			-diff -y $(SRC) Sully2.c
			-diff -y $(SRC) Sully1.c

.PHONY: all, clean, fclean, re, test, vtest, diff



