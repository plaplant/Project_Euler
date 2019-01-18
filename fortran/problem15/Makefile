# Compiler
FC = gfortran-mp-8
FFLAGS = -O3 -fopenmp

# Executable
problem15.x:
	$(FC) $(FFLAGS) problem15.f90 -o $@

all: problem15.x

clean:
	rm -rf *.o *.mod problem15.x
