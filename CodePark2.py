"""
Desenvolva um código que utilize as seguintes características de um veículo:
- Quantidade de rodas;
- Peso bruto em quilogramas;
- Quantidade de pessoas no veículo.

Com essas informações, o programa mostrará qual é a melhor categoria de habilitação para o veículo informado a partir das condições:
A: Veículos com duas ou três rodas;
B: Veículos com quatro rodas, que acomodam até oito pessoas e seu peso é de até 3500 kg;
C: Veículos com quatro rodas ou mais e com peso entre 3500 e 6000 kg;
D: Veículos com quatro rodas ou mais e que acomodam mais de oito pessoas; 
E: Veículos com quatro rodas ou mais e com mais de 6000 kg.

Trabalhe esse código em seu IDE, suba ele para sua conta no GitHub e compartilhe o link desse projeto no campo ao lado para que outros desenvolvedores possam analisá-lo.
"""

# Variáveis
qntd_rods:int = 0
peso_brut:float = 0.0
qntd_pess:int = 0
catg_habi:str = ""

# 1º - Ler caracteristicas do veículo
qntd_rods = int(input("Informe quantas rodas tem o veículo: "))
peso_brut = float(input("Informe o peso do veículo: "))
qntd_pess = int(input("Informe quantas pessoas o veículo pode acomodar: "))
# 2º - Avaliar características
if (qntd_rods > 1) and (qntd_rods <= 3):
    catg_habi = "A"

elif (qntd_rods == 4) and (qntd_pess <= 8) and (peso_brut <= 3500):
    catg_habi = "B"

elif (qntd_rods >= 4) and ((peso_brut >= 3500) and (peso_brut <= 6000)):
    catg_habi = "C"

elif (qntd_rods >= 4) and (qntd_pess > 8):
    catg_habi = "D"

elif (qntd_rods >= 4) and (peso_brut > 6000):
    catg_habi = "E"

 
# 3º - Imprimir resultado

print("A melhor categoria de habilitação para o veícuo é : ", catg_habi)