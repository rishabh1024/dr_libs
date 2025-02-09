FROM ubuntu:20.04 as base

COPY . .

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y clang-8

RUN clang-8 -g -O1 -fsanitize=fuzzer,address -o fuzz_dr_flac /tests/flac/fuzz_dr_flac.c
