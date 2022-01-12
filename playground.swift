import Foundation

var valor1=0
var valor2=0
var resfib=0
var resFibonacci=""

valor1=0
valor2=1

resfib=valor1+valor2
resFibonacci=String(valor1)+","+String(valor2)+","

for seq in 1...48 {
    valor1=valor2
    valor2=resfib

    resFibonacci=resFibonacci+String(resfib)+","
    resfib=valor1+valor2
}
print(resFibonacci.dropLast())
    