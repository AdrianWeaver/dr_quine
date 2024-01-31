NAME	=	Grace

SRC		=	Grace.s

CC		=	gcc
CFLAGS	=	-nostartfiles

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

fclean:		clean
			rm -rf $(NAME)
			
re:			clean
			$(MAKE) all

test:		$(NAME)
			@cat	$(SRC)
			./$(NAME)

diff:		$(NAME)
			./$(NAME) > output.txt
			diff $(SRC) output.txt

debug:
			gdb ./$(NAME)

.PHONY: all, clean, fclean, re, test, diff, debug
