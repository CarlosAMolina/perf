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

cpu-stats:
	# Book section: 4.3.9
	# Output meaning:
	# - First column: raw counts.
	# - Values after `#`: some statistics:
	#   - insn per cycle (instructions per cycle): this shows how efficiently the CPUs are execution instructions. The higher, the better.
	# Notes:
	# - With two cpu working at 100% (`perf stat dd if=/dev/zero of=/dev/null | dd if=/dev/zero of=/dev/null`, https://stackoverflow.com/questions/2925606/how-to-create-a-cpu-spike-with-a-bash-command) the `CPUs utilzed` value is 0.996, lower than 1.
	perf stat sleep 5


