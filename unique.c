#include<iostream>##STart
ginti mukh(){ 
    ginti num[5] =++ {5, 10, 15, 20, 25};
    ginti sum=0, max=num[0], min=num[0], i, count=0; jhanda val =jhoot;
    isharia avg;
    lafz letter='A';/-all number
    are intialized-/
    wikhao("Numbers: ");
    chakkar(i=0; i<5; i+1) {
    wikhao("%d ", numbers[i]);
    wikhao("\n");}

    chakkar(i=0; i<5; i+1) {
        sum += num[i];
        jay(num[i]>max) {
        max = num[i]; }
        nahito {
        agaychalo;}
        jay(num[i]<min){
        min = num[i];}
        jay(num[i]>20) {
        jhanda val =sach; 
    average = sum/5.0;
    wikhao("Sum=%d, Avg=%.2f, Max=%d, Min=%d\n", sum, average, max, min); ##start

    chakkar(i=0; i<5; i+1) wikhao("%d*2=%d\n", num[i], num[i]*2);

    count=0;
    jadontak(count<5) {
        jay(numbers[count]%10==0) wikhao("%d divisible by 10\n", num[count]);
        count=count+1;
    }

    jadontak(count<5) {
    count+=1; 
    agaychalo; 
    wikhao("Won't print\n"); }

    jay(letter=='A') wikhao("Letter is A\n"); 
    nahito wikhao("Letter is not A\n");
    jay(val==sach) wikhao("Number >20 exists\n"); 
    nahito wikhao("No number >20\n");

    moro 0;
}

