print("****Bienvenidos a la facturacion de compras****");
name=str(input("Favor de ingresar su nombre :"));
jean=int(input("Ingrese la contidad de pantalones a llevar :"));
mul=float(jean*160.50);
if jean >=7 :
 descuento=mul*0.10
 total=mul-descuento;
 print(name,"Se le ha heco el descuento de ",descuento)
 print(name,"te corresponde pagar",total)
elif jean>=10 :
 descuento1=mul*0.25
 total=mul-descuento1;
 print(name,"Se le ha heco el descuento de ",descuento1)
 print(name,"te corresponde pagar",total)
elif mul >= 700 :
 descuento2 = mul * 0.05
 total = mul - descuento2;
 print(name,"Se le ha heco el descuento de ",descuento2)
 print(name,"te corresponde pagar",total)

else :
 print("Lo siento no se le ha hecho un descuento por conpras menores")
 print (name,"su total a pagar son ",mul)
