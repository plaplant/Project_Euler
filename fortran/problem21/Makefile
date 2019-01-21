# Compiler
FC = gfortran-mp-8
FFLAGS = -O3

# Executable
problem21.x:
	$(FC) $(FFLAGS) problem21.f90 -o $@

all: problem21.x

clean:
	rm -rf *.o *.mod problem21.x
