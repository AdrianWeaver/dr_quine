NAME	=	Grace

SRC		=	Grace.c

CC		=	clang

OBJ	=	$(SRC:.c=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) $(CFLAGS) $^ -o $@

%.o:		%.c
	$(CC) $(CFLAGS) $< -o $@ -c


clean:
			rm -rf $(OBJS)
			rm -rf previous_Grace_version

fclean:		clean
			rm -rf $(NAME)
			
re:			fclean
			$(MAKE) all

test:		$(NAME)
			./$(NAME)
	
vtest:		$(NAME)
			valgrind ./$(NAME)

diff:		$(NAME)
			cat $(SRC) > previous_Grace_version
			./$(NAME)
			diff -s $(SRC) previous_Grace_version

.PHONY: all, clean, fclean, re, test, vtest, diff



