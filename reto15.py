from datetime import datetime


def check_format(string):
	output = True
	
	if not isinstance(string, str):
		output = False
	else:
		splited_string = string.split("/")
		if not (len(splited_string) == 3 and len(splited_string[0]) == 2 and
				len(splited_string[1]) == 2 and len(splited_string[2]) == 4):
			output = False
		else:
			try:
				int(splited_string[0])
				int(splited_string[1])
				int(splited_string[2])
			except:
				output = False
	
	return output

def get_days_difference(day_start, day_end):
	if check_format(day_start) and check_format(day_end):
		try:
			output = abs(datetime.strptime(day_start, "%d/%m/%Y") - \
						 datetime.strptime(day_end, "%d/%m/%Y")).days
		except:
			output = "No es una fecha válida."
	else:
		output = "No cumple con el formato 'dd/mm/yyyy'."
	
	return output

if __name__ == "__main__":
	print(get_days_difference("31/12/2010", "31/12/2009"))  # 365
	print(get_days_difference("01/01/1000", "01/01/2000"))  # 365242
	print(get_days_difference("44/44/4444", "01/01/2000"))  # No es una fecha válida.
	print(get_days_difference("01/01/01", "02/02/02"))  # No cumple con el formato 'dd/mm/yyyy'.
	print(get_days_difference("01/01/2010", "bb/bb/bbbb"))  # No cumple con el formato 'dd/mm/yyyy'.
