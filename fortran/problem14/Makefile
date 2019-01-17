# Compiler
FC = gfortran-mp-8
FFLAGS = -O3

# Executable
problem14.x:
	$(FC) $(FFLAGS) problem14.f90 -o $@

all: problem14.x

clean:
	rm -rf *.o *.mod problem14.x
