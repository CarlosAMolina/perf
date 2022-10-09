## Introduction

Project to learn how to use perf.

## Install

Debian:

```bash
sudo apt-get install linux-perf
```

## Modify file values

### /proc/sys/kernel/perf_event_paranoid

If you get this error when modifying the file:

```bash
sudo vi /proc/sys/kernel/perf_event_paranoid
# "/proc/sys/kernel/perf_event_paranoid" E667: Falló "fsync" (sincronización de archivo)
```

Edit it with this command:

```bash
make config-system
```

### Initial values

```bash
sudo echo 1 > /proc/sys/kernel/nmi_watchdog
sudo echo 2 > /proc/sys/kernel/perf_event_paranoid
```

## Resources

- Book: <https://www.brendangregg.com/systems-performance-2nd-edition-book.html>

- Command examples: <https://www.brendangregg.com/perf.html>
