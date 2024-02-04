SRC	=	Grace.py

RUNNER = python3

all:	run

run:		$(SRC)
			$(RUNNER) $(SRC)

test:		$(SRC)
			$(MAKE) run

diff:		
			cat $(SRC) > previous_Grace.py
			@$(RUNNER) $(SRC)
			-diff -y -s $(SRC) previous_Grace.py

.PHONY: all, test, diff
