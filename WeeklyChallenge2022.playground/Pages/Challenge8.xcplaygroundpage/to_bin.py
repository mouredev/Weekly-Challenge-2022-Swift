def to_bin(n):
	dec = n
	bin_reverse = []
	while n > 0:
		bin_reverse.append(n % 2)
		n //= 2
	bin = bin_reverse[::-1]
	str_bin = ''.join(list(map(str, bin)))
	print(f"Decimal: {dec} <=> Binary: {str_bin}")
	return str_bin

num = int(input('Type the decimal number to convert to binary: '))
to_bin(num)