DESTDIR="$(HOME)/bin"
ERROR_MESSAGE="cannot copy to $(DESTDIR): no such directory. Specify DESTDIR variable"

install:
	@if [ -d $(DESTDIR) ]; then \
		cp MPIRUN $(HOME)/bin; \
		cp MPIRUNrc $(HOME)/.MPIRUNrc; \
		echo cp MPIRUN $(HOME)/bin; \
		echo cp MPIRUNrc $(HOME)/.MPIRUNrc; \
	else \
		echo $(ERROR_MESSAGE); \
	fi
