NAME	=	Colleen

SRC		=	Colleen.s

AS		=	nasm
ASFLAGS	=	-felf64 -g

OBJ	=	$(SRC:.s=.o)

all:	$(NAME)

$(NAME):	$(OBJ)

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

.PHONY: all, clean, fclean, re, test, diff
