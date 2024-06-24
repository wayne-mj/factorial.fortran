FC=gfortran
FFLAGS=-O3 -Wall -Wextra
#MODULES=
PROG=factorial.f95
SRC=$(MODULES) $(PROG)
OBJ=${SRC:.f95=.o}
BASE=${SRC:.f95=}

all: clean factorial

%.o: %.f95
	$(FC) $(FFLAGS) -o $@ -c $<

factorial: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

lib: $(MODULES)
	$(FC) $(FFLAGS) -c $(MODULES)

clean:
	rm -f *.o *.mod $(BASE)