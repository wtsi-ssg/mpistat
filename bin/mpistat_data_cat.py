#!/usr/bin/env python

import sys
import gzip
import base64

def main(argv):
   filename = argv[0]
   with gzip.open(filename, 'r') as f:
      for line in f:
         cols = line.split("\t")
         cols[0] = base64.b64decode(cols[0])
         sys.stdout.write("\t".join(cols))
         
if __name__ == "__main__":
   main(sys.argv[1:])
