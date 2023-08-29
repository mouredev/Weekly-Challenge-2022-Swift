def delete_chars(str1, str2):
	out1 = set(str1) - set(str2)
	out2 = set(str2) - set(str1)
	return ''.join(out1), ''.join(out2)

str1 = input('Type the first string: ')
str2 = input('Type the second string: ')
out1, out2 = delete_chars(str1, str2)
print(f'Deletion chars of first string: {out1}')
print(f'Deletion chars of second string: {out2}')