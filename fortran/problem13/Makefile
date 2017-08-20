# Compiler
FC = gfortran-mp-4.8
FFLAGS = -O3

# Object files
OBJ = big_int_math.o

# Executable
big_int_test.x: $(OBJ)
	$(FC) $(FFLAGS) big_int_test.f90 $(OBJ) -o $@

problem13.x: $(OBJ)
	$(FC) $(FFLAGS) problem13.f90 $(OBJ) -o $@

%.o : %.f90
	$(FC) $(FFLAGS) -c $*.f90

all: big_int_test.x problem13.x

default: big_int_test.x

clean:
	rm -rf *.o *.mod big_int_test.x

cleanall:
	rm -rf *.o *.mod big_int_test.x problem13.x
