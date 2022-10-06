PROCESS_ID=$(shell pgrep -o firefox)

config-system:
	# https://askubuntu.com/questions/167819/im-getting-fsync-failed-error-why
	echo -1 | sudo dd of=/proc/sys/kernel/perf_event_paranoid

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

syscall-tracing-summary:
	# Book section: 5.5.1.
	# Shows syscall counts and timing ofr each thread.
	# Stop the process with `control + c`.
	sudo perf trace -s -p $(PROCESS_ID)

syscall-tracing-events:
	# Book section: 5.5.1.
	# Traces system calls of a process.
	# `perf trace` shows time in syscall.
	# -e: filter event. Run `perf list` to see available events to filter.
	sudo perf trace -p $(PROCESS_ID)


