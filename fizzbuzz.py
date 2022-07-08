i = 1
while i <= 100:
    if (i%15) == 0:
        print('fizzbuzz')
        i = i + 1
    elif (i%5) == 0:
        print('buzz')
        i = i + 1
    elif (i%3) == 0:
        print('fizz')
        i = i + 1
    else:
        print(i)
        i = i + 1
