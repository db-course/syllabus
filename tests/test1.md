[Назад к главной странице курса](https://github.com/db-course/syllabus)

## 1. Реляционная алгебра

### Цель работы

Приобретение навыков использования операций реляционной алгебры для выполнения типовых запросов к данным в реляционной модели.

 7 вариант

Часть 1

R1[f,country,city];R2[n,f,ds,dn];R3[client,country,n];

1.

R4=R1[country=>c][f,c];

R5=R2[n,f]*R3;

R6=R4*R5;

R7=R6[c<>country][f];

2.

R6=R2[n,f]*R3[client,n];

R7=R6[n=>nn,f=>ff,client=>cl];

R8=R6#R7;

R9=R8[client==cl and f<>ff][client];

3.

R10=R3[country]\R1[country];

4.

R4=R2[f]*R1[f,city];

R5=R1[f,city]\R4;

R6=R5[city];

5.

R4=R2[n,f]*R3[n,country];

R5=R1[country=>cn][cn,f];

R6=R5*R4;

R7=R6[f=>ff,cn=>cnn,n=>nn,country=>countr];

R8=R7#R6;

R9=R8[cnn==cn and  n<>nn and country==countr][country];

Часть 2

R1[fio,kaf];R2[fio,dis,type];R3[dis,k];

1.

R4=R2[fio=>f,type=>t][f,t];

R5=R4#R2[fio,type];

R6=R5[f==fio and t<>type][fio];

R7=R2[fio]\R6;

2.

R4=R2[type=="KP"][fio];

R6=R1/R4;

R7=R1[kaf]\R6;

3.

R4=R3*R2[dis,fio]*R1;

R5=R4[kaf==44][k];

4.

R4=R3*R2[dis,fio]*R1;

R5=R4[k<3][kaf];

5.

R4=R2*R1;

R5=R4[fio=>f,dis=>d,type=>t,kaf=>k];

R6=R4#R5;

R7=R6[type==t and t=="speak" and dis==d and kaf<>k][dis];

[Назад к главной странице курса](https://github.com/db-course/syllabus)
