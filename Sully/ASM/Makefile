NAME	=	Sully

SRC		=	Sully.s

CC		=	clang
#CFLAGS	=	-nostartfiles -no-pie

AS		=	nasm
ASFLAGS	=	-felf64 -g 

OBJ	=	$(SRC:.s=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
		$(CC) $(CFLAGS) $< -lc -o $(NAME)

%.o:		%.s
	$(AS) $(ASFLAGS) $<

clean:
			rm -rf $(OBJ)
			rm -rf Sully?.s

fclean:		clean
			rm -rf $(NAME)
			
re:			clean
			$(MAKE) all

test:		$(NAME)
			./$(NAME)
			@ls
			cat Sully5.s
			cat Sully4.s
			cat Sully3.s
			cat Sully2.s
			cat Sully1.s

vtest:		$(NAME)
			valgrind ./$(NAME)

diff:		$(NAME)
			./$(NAME)
			-diff -y $(SRC) Sully5.s
			-diff -y $(SRC) Sully4.s
			-diff -y $(SRC) Sully3.s
			-diff -y $(SRC) Sully2.s
			-diff -y $(SRC) Sully1.s


debug:
			gdb ./$(NAME)

.PHONY: all, clean, fclean, re, test, vtest, diff, debug
