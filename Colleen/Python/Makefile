SRC	=	Colleen.py

RUNNER = python3

all:	run

run:		$(SRC)
			$(RUNNER) $(SRC)

test:		$(SRC)
			@cat	$(SRC)
			$(MAKE) run

diff:		
			@$(RUNNER) $(SRC) > output.txt
			diff -s -y $(SRC) output.txt

.PHONY: all, test, diff
