def factorial(num):
	if num == 1:
		return 1
	return num * factorial(num - 1)

num = int(input('Type the number: '))

if num == 0:
	print('Factorial: 1')
	exit()
elif num < 0:
	print('The negative numbers does not have factorial')
	exit()

print(f"{num}! = {factorial(num)}")