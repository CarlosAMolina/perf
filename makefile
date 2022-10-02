PROCESS_ID=$(shell pgrep -o firefox)

cpu-profiling:
	# Book section: 5.5.1.
	# - F 49: 49 Hertz (samples / second).
	# -a sample across al CPUs.
	# -g: sample stack traces.
	# 5: seconds to get samples. 
	# perf.data: output file with results.
	perf record -F 49 -a -g -- sleep 5

cpu-profiling-print:
	# Book section: 5.5.1.
	perf script --header

syscall-tracing:
	# Book section: 5.5.1.
	# Traces system calls of a process.
	# `perf trace` shows time in syscall.
	sudo perf trace -p $(PROCESS_ID)

syscall-tracing-summary:
	# Book section: 5.5.1.
	# Shows syscall counts and timing ofr each thread.
	sudo perf trace -s -p $(PROCESS_ID)
