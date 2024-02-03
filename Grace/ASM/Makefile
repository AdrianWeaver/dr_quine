NAME	=	Grace

SRC		=	Grace.s

CC		=	gcc
CFLAGS	=	-nostartfiles -no-pie

AS		=	nasm
ASFLAGS	=	-felf64 -g 

OBJ	=	$(SRC:.s=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
		$(CC) $(CFLAGS) $< -lc -o $(NAME)

%.o:		%.s
	$(AS) $(ASFLAGS) $<

clean:
			rm -rf $(OBJS)
			rm -rf previous_Grace_version

fclean:		clean
			rm -rf $(NAME)
			
re:			clean
			$(MAKE) all

test:		$(NAME)
			./$(NAME)

vtest:		$(NAME)
			valgrind ./$(NAME)

diff:		$(NAME)
			cat $(SRC) > previous_Grace_version
			./$(NAME)
			diff -s $(SRC) previous_Grace_version

debug:
			gdb ./$(NAME)

.PHONY: all, clean, fclean, re, test, vtest, diff, debug
