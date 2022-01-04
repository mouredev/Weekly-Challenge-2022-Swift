import sys

def normalize(s):
    replacements = (
        ("á", "a"),
        ("é", "e"),
        ("í", "i"),
        ("ó", "o"),
        ("ú", "u"),
    )
    for a, b in replacements:
        s = s.replace(a, b).replace(a.upper(), b.upper())
    return s
	
def anagrama(palabra1, palabra2):
	p1=palabra1.strip()
	p2=palabra2.strip()
	p1=normalize(p1.lower())
	p2=normalize(p2.lower())
	if len(p1)!=len(p2):
		return "false l"

	c=0
	sw=0
	
	for a in range(len(p2)):
		if p2[a:a+1] in p1:
			c=c+1
			
	if c==len(p2): 
		return "true"
	else:
		return "false"

print(anagrama(sys.argv[1],sys.argv[2]))