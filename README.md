ssdbenchmark
============

Setup and fio config files to benchmark SSDs

The program `ssdsetup.sh` first initializes the ssd to factory settings,
then it zeros out the SSD twice.  For example, if the ssd is on `/dev/sdb`,
you can type the following:


```
# ssdsetup.ssh /dev/sdb
```

Edit the file `fiocfg` and add the correct device node to `filename=`.  Then
run the benchmark by doing the following:

```
# fio fiocfg
```
