NAME	=	Colleen

SRC		=	Colleen.s

CC		=	clang

AS		=	nasm
ASFLAGS	=	-felf64 -g

OBJ	=	$(SRC:.s=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
		$(CC) $< -lc -o $(NAME)

%.o:		%.s
	$(AS) $(ASFLAGS) $<

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

debug:
			gdb ./$(NAME)

.PHONY: all, clean, fclean, re, test, diff, debug
