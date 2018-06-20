#!/bin/bash

file=$1
ag 'SUCCESS' $file | gawk -F " " '{ print $11,","$14,",",$18 }' | sort
