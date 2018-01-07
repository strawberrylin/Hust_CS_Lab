	obj-m := mydrive.o
	PWD := $(shell pwd)
	KERNELDIR := /usr/src/linux-3.13.2
all:
	make -C $(KERNELDIR) M=$(PWD) modules


.PHONY: clean
clean:
	rm -rf *.o *~ core *.ko *.mod.c modules.order Module.symvers
