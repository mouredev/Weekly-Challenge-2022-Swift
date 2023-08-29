from re import search
from winsound import Beep
from time import sleep

class Morse():
	freq = 500
	morse_regex = '[.-]{1,5}( ?[.-]{1,5})*(  ?[.-]{1,5}( ?[.-]{1,5})*)*'
	alpha_morse = {
		'a': '.-',
		'b': '-...',
		'c': '-.-.',
		'd': '-..',
		'e': '.',
		'f': '..-.',
		'g': '--.',
		'h': '....',
		'i': '..',
		'j': '.---',
		'k': '-.-',
		'l': '.-..',
		'm': '--',
		'n': '-.',
		'ñ': '--.--',
		'o': '---',
		'p': '.--.',
		'q': '--.-',
		'r': '.-.',
		's': '...',
		't': '-',
		'u': '..-',
		'v': '...-',
		'w': '.--',
		'x': '-..-',
		'y': '-.--',
		'z': '--..',
		'0': '-----',
		'1': '.----',
		'2': '..---',
		'3': '...--',
		'4': '....-',
		'5': '.....',
		'6': '-....',
		'7': '--...',
		'8': '---..',
		'9': '----.',
		'.': '.-.-.-',
		',': '--..--',
		'?': '..--..',
		'"': '.-..-.',
		' ': '  '
	}
	
	def _morse(self):
		return list(self.alpha_morse.values())
	def _alpha(self):
		return list(self.alpha_morse.keys())
	def morse_alpha(self):
		return {m: self._alpha()[i] for i, m in enumerate(self._morse())}
	def _point(self):
		Beep(self.freq, 300)
	def _dash(self):
		Beep(self.freq, 800)
	def _one_space(self):
		sleep(.3)
	def _two_spaces(self):
		sleep(.8)
	def play(self, code):
		for ch in code:
			if ch == '-': self._dash()
			elif ch == '.': self._point()
			elif ch == ' ': self._one_space()
			elif ch == '  ': self._two_spaces()
	def is_morse(self, text):
		return bool(search(self.morse_regex, text))
	def to_natural_text(self, code):
		text = []
		for word in code.split('  '):
			for letter in word.split(' '):
				text.append(self.morse_alpha()[letter])
			text.append(' ')
		print('The text is:')
		print(''.join(text))
	def to_morse(self, text):
		code = []
		for word in text.split(' '):
			for letter in word:
				code.append(' ')
				code.append(self.alpha_morse[letter])
			code.append('  ')
		print('The code is:')
		print(''.join(code).strip())
		self.play(''.join(code).strip())
	def convert(self, msg):
		if self.is_morse(msg):
			self.to_natural_text(msg)
		else:
			self.to_morse(msg)
	def test(self):
		msg = input('Type a message: ')
		self.convert(msg)

if __name__ == '__main__':
	Morse().test()