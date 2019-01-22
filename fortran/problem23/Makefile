# Compiler
FC = gfortran-mp-8
FFLAGS = -O3 -fopenmp

# Executable
problem23.x:
	$(FC) $(FFLAGS) problem23.f90 -o $@

all: problem23.x

clean:
	rm -rf *.o *.mod problem23.x
