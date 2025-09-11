#!/bin/bash
curl -X POST "$1" -H "HOST :$2" -d "$3"
