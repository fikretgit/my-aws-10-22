#!/bin/bash
grep -w "i-0c127ab5cdf997cf4" event_history.csv | tee result.txt
