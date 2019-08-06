#include <iostream>
#include <math.h>

#define PI 3.14159265

//COMPROBACION DE TUBERIAS SIMPLES. por Johna Buitrago
using namespace std;

double d,H,hf2,p,u,z2,L,V;
long double Ks,Km,e,hm,f;
int Re;

main()
{

    cout<<"\tINGRESE LOS DATOS DE ENTRADA"<<endl;
       cout<<"\tdiametro de la tuberia(m) :";cin>>d;
       cout<<"\tlongitud de la tuberia(m) :";cin>>L;
       cout<<"\trugosidad de la tuberia :";cin>>Ks;
       cout<<"\tcoeficiente de perdidas menores :";cin>>Km;
       cout<<"\tcota 1(m) :";cin>>H;
       cout<<"\tcota 2(m) :";cin>>z2;
       cout<<"\tdensidad del agua(kg/m3) :";cin>>p;
       cout<<"\tviscosidad dinamica(Pa*s) :";cin>>u;
       cout<<"\n\testablezca el error del calculo :";cin>>e;

    double hf1=H-z2;
    double error;
    double Q=0;
    int i=0;
                               bool resuelto=true; AUN NO

    cout<<"\ti\t V\t Hf\t Hf+1\t hm\t    e"<<endl;
    cout<<"\t----------------------------------------------"<<endl;


        while (resuelto)
        {
        i++;
        V=((-2*sqrt(2*9.8*d*hf1))/sqrt(L))*(log10((Ks/3.7*d)+((2.51*u/p)*sqrt(L))/(d*sqrt(2*9.8*d*hf1))));
        hf2=H-(Km*(pow(V,2))/(2*9.81));
        Hm=H-hf2;

        error=fabs(hf1-hf2);

        cout<<"\t"<<i<<"\t"<<V<<"\t"<<hf1<<"\t"<<hf2<<"\t"<<Hm<<"\t"<<error<<endl;

        if (error<=e)
           {
           resuelto=false;
           }
            hf1=hf2;
       }

    Q=V*PI*(pow(d,2)/4)*1000;
    Re=(p*d*V)/u;
    f=(2*9.8*d*hf2)/(sqrt(L)*V);

        cout<<"\nQ es :"<<Q<<endl;
        cout<<"\nNumero de Reynolds :"<<Re<<endl;
        cout<<"\nEl flujo es ";
       
 if (Re<=2100)cout<<"laminar"<<endl;
        else if (Re>2000&&Re<=4500)cout<<"critico"<<endl;
        else if(Re>4500)cout<<"turbulento"<<endl;

    }
