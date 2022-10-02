PROCESS_ID=$(shell pgrep -o firefox)

cpu-profiling:
	# - F 49: 49 Hertz (samples / second).
	# -a sample across al CPUs.
	# -g: sample stack traces.
	# 5: seconds to get samples. 
	# perf.data: output file with results.
	# book section: 5.5.1.
	perf record -F 49 -a -g -- sleep 5

cpu-profiling-print:
	# book section: 5.5.1.
	perf script --header

syscall-tracing:
	# Traces system calls of a process.
	# book section: 5.5.1.
	sudo perf trace -p $(PROCESS_ID)
