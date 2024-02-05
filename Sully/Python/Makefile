SRC	=	Sully.py

RUNNER = python3

all:	run

run:		$(SRC)
			$(RUNNER) $(SRC)

test:		$(SRC)
			$(MAKE) --no-print-directory run

clean:		
			rm Sully?.py
			
fclean:		clean

diff:		
			@$(RUNNER) $(SRC)
			diff -y -s $(SRC) Sully4.py
			diff -y -s $(SRC) Sully3.py
			diff -y -s $(SRC) Sully2.py
			diff -y -s $(SRC) Sully1.py

.PHONY: all, test, diff
