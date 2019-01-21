# Compiler
FC = gfortran-mp-8
FFLAGS = -O3

# Executable
problem19.x:
	$(FC) $(FFLAGS) problem19.f90 -o $@

all: problem19.x

clean:
	rm -rf *.o *.mod problem19.x
