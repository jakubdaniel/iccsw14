#!/bin/sh

PATH="$PATH:blast-2.5/blast/blast-2.5-linux-x86_64-bin/" ./blast-2.5/blast/blast-2.5-linux-x86_64-bin/pblast.opt $1 blast_svcomp.c
