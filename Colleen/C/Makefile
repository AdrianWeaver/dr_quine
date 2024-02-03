NAME	=	Colleen

SRC	=	Colleen.c

CC		=	clang

OBJ	=	$(SRCS:.c=.o)

all:	$(NAME)

$(NAME):	$(OBJ)

%.o:		%.c
	$(CC) $(CFLAGS) $< -o $@ -c


clean:
			rm -rf $(OBJS)

fclean:		clean
			rm -rf $(NAME)
			
re:			clean
			$(MAKE) all

test:		$(NAME)
			@cat	$(SRC)
			./$(NAME)

diff:		$(NAME)
			./$(NAME) > output.txt
			diff -s $(SRC) output.txt

.PHONY: all, clean, fclean, re, test, diff



