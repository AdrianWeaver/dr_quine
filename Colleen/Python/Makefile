SRC	=	Colleen.py
CC		=	clang

RUNNER = python3

all:	run

run:		$(SRC)
			$(RUNNER) $(SRC)

test:		$(SRC)
			@cat	$(SRC)
			$(MAKE) run

diff:		
			@$(RUNNER) $(SRC) > output.txt
			diff $(SRC) output.txt

.PHONY: all, test, diff
