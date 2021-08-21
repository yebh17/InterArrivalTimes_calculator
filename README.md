# Active-Testing (v1.0.0)

## About the application

A simple application to calculate the Inter-arrival and Inter-departure times from the raw outputs gathered from [DPMI/trafficgenerators](https://github.com/DPMI/trafficgenerators) and plot graphs for the "Inter-arrival times percentiles", "Inter-departure times percentiles", "Seq no. Vs Inter-arrival times", "Seq no. Vs Inter-departure times".

## Steps

- `git clone https://github.com/yebh17/active-testing.git`
- `cd active-testing`
- `./initialize`
- `make && make clean` (make clean cleans all the unwanted images that are created just for creating the final collaged images)

You can use `make fresh` for cleaning all the generated files and get back a fresh repo.

You can use `make help` if wanted to check all the different commands available.

NOTE: This application only runs in linux and also can take a bit time for executing and producing results since there are lot of data points and many files to create. The repo size after producing the results can be approximately 110M.