#!/bin/bash
^sudo\s+nmap(?=.*-sn)(?=.*\$1)(?=.*-PR)(?:\s+(?:-sn|-PR|\$1))+$
