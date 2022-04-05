def is_armnstrong_number(num):
	p = 0
	while p <= len(str(num)):
		p += 1
		sum = 0
		for i in range(len(str(num))):
			sum += pow(int(str(num)[i]), p)
		if num == sum:
			return True
	return False

if __name__ == '__main__':
	import sys
	if is_armnstrong_number(int(sys.argv[1])):
		print(f"{sys.argv[1]} is an Armnstrong's number")
	else:
		print(f"{sys.argv[1]} is not an Armnstrong's number")