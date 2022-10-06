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

## Resources

- Book: <https://www.brendangregg.com/systems-performance-2nd-edition-book.html>

