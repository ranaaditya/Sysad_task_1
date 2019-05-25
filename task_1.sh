#!/bin/bash
#current user=root
#creating new users

useradd -m u:MasterH; echo -e "MasterH\nMasterH"|passwd MasterH
useradd -m u:Heisenberg; echo -e "Heisenberg\nHeisenberg"|passwd Heisenberg
useradd -m u:Hertz; echo -e "Hertz\nHertz"|passwd Hertz
useradd -m u:Holland; echo -e "Holland\nHolland"|passwd Holland

#creating interns 
for x in {1..20};do useradd -m u:Heisenberg$x;echo -e "Heisenberg$x\nHeisenberg$x"|passwd Heisenberg$x;useradd -m u:Hertz$x;echo -e "Hertz$x\nHertz"|passwd Hertz$x";useradd -m useradd -m u:Holland$x;echo -e "Holland$x\nHolland$x"|passwd Holland$x; done        

#permissions to the scientists to read intern's diectories
for a in {1..20}; setfacl -R -m u:Heisenberg:r-x ~/Heisenberg$a;setfacl -R -m u:Hertz:r-x ~/Hetrtz$a;setfacl -R -m u:Holland:r-x ~/Holland$a;done

#permission to the MasterH to access other's directories
setfacl -R -m u:MasterH:r-x ~/Heisenberg
setfacl -R -m u:MasterH:r-x ~/Hertz
setfacl -R -m u:MasterH:r-x ~/Holland

for y in{1..20};setfacl -R -m u:MasterH:r-x ~/Heisenberg$y;setfacl -R -m u:MasterH:r-x ~/Hertz$y;setfacl -R -m u:MasterH:r-x ~/Holland$y;done

#setting permissions for scientists
chmod 770 ~/Heisenberg
chmod 770 ~/Hertz
chmod 770 ~/Holland

#permission for other  interns
for b in{1..20};chmod 770 /home/Heisenberg$b;chomd 770 ~/Hertz$b;chmod 770 ~/Holland$b;

#file permission for not executng files  before modification

crontab -e
00 * * * *  for b in {1..20}; do  for n in {1..50};do if($(stat -c %y /home/Heisenberg$b/Heisenberg_task$n.txt))  then chmod 770 /home/Heisenberg$b/Heisenberg_task$n else chmod 660 /home/Heisenberg$b/Heisenberg_task$n.txt fi ;if($(stat -c %y /home/Hertz$b/Hertz_task$n.txt))  then chmod 770 /home/Hertzg$b/Hertz_task$n else chmod 660 /home/Hertz$b/Hertz_task$n.txt fi ;if($(stat -c %y /home/Holland$b/Holland_task$n.txt))  then chmod 770 /home/Holland$b/Holland_task$n else chmod 660 /home/Holland$b/Holland_task$n.txt fi ;done;done


#creating the folders  in scientists account
for q in {1..5};do mkdir task$q /home/Heisenberg;done
for w in {1..5};do mkdir task$w /home/Hertz;done
for e in {1..5};do mkdir task$e /home/Holland;done

#creat the folders for the students 
for c in {1..20};do for d in{1..5}; do mkdir task$d /home/Heisenberg$c;mkdir task$d /home/Hertz$c; mkdir task$d /home/Holland$c;done;done 

#filling the task folder of scientists with random  128ASCII characters 

for s in {1..50};do for j in {1..5};do  tr-dc A-Za-z0-127</dev/urandom |head -c 128 > /home/Heisenberg/task$j/Heisenberg_task$s.txt; tr-dc A-Za-z0-127</dev/urandom |head -c 128 > /home/Hertz/task$j/Hertz_task$s.txt; tr-dc A-Za-z0-127</dev/urandom |head -c 128 > /home/Holland/task$j/Holland_task$s.txt;done;done        

#copying random task files from scientists to the intern's folder

crontab -e
00 00 * * * for i in {1..20};do  k=$(shuf -i 1-5 -n 1) ;   for j in $(shuf -i 1-50 -n 5);do cp /home/Heisenberg/task$k/Heisenberg_task$j.txt  /home/Heisenberg$i/task$k/Heisenberg$i_task$j.txt;cp /home/Hertz/task$k/Hertz_task$j.txt /home/Hertz$i/task$k/Hertz$i_task$j.txt;cp /home/Holland/task$k/Holland_task$j.txt /home/Holland$j/task$k/Holland$i_task$j.txt;done;done

























