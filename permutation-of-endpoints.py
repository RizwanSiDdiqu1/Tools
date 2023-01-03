import sys
import itertools

# check if the input file name was provided as an argument
if len(sys.argv) < 2:
    print("Usage: python script.py <input_file>")
    sys.exit(1)

# get the input file name from the command line argument
input_file = sys.argv[1]

# read the input endpoint from the specified file
with open(input_file, "r") as f:
    endpoint = f.read().strip()

# split the input endpoint into a list of path components
components = endpoint.split("/")

# generate all permutations of the list
for permutation in itertools.permutations(components):
    print("/".join(permutation))
