# A script to parse the output of blast

# open 2 files for reading and writing
with open('results.out', 'r') as fi, open('results.csv', 'w') as fo:

	# identify a marker in the file
	while(True):
		# read one line a time
		line = fi.readline()
		# break a string into tokens
		tokens = line.rstrip().split()
		# look for our marker
		if len(tokens) >0 and tokens[0] == 'RID:':
			# skip 3 lines
			for i in range(3):
				next(fi)
			break

	# print the header of output file
	print('ID\tDescription\tScore\tE-Value', file=fo)

	# start writing
	while(True):
		line = fi.readline()
		tokens = line.rstrip().split()
		if len(tokens) >0:	
			# get each column
			id = tokens[0]
			description = ''.join(tokens[1:-2])
			score = tokens[-2]
			evalue = tokens[-1]
			# write one line a time
			print('{}\t{}\t{}\t{}'.format(id, description, score, evalue), file=fo)
		else:
			break

