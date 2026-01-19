printf "\033c\n "

                mkdir /tmp/root 2> /dev/null
                printf "y\n" | rm /tmp/root/* 2> /dev/null
                printf "y\n" | rm /tmp/root/*.* 2> /dev/null
echo '.........................................'
printf "\033[40;37m\ngive me the files to include in main root ? "
read a
for b in $a
do
    cp $b /tmp/root/
done
echo '.........................................'

printf "\033[40;37m\ngive me iso image name ? "
read h
chmod 777 /tmp/root/*
echo '.........................................'
cp isolinux.bin /tmp/root 2> /dev/null
cp isolinux.cfg /tmp/root 2> /dev/null
cp vmlinuz /tmp/root 2> /dev/null
cp initrd.img /tmp/root 2> /dev/null
cp ldlinux.c32 /tmp/root 2> /dev/null
cp init /tmp/root 2> /dev/null
cp linuxrc /tmp/root 2> /dev/null
mkdir /tmp/root/etc 2> /dev/null
mkdir /tmp/root/dev 2> /dev/null
mkdir /tmp/root/bin 2> /dev/null
mkdir /tmp/root/sbin 2> /dev/null
mkdir /tmp/root/usr 2> /dev/null
mkdir /tmp/root/root 2> /dev/null
mkdir /tmp/root/root/etc 2> /dev/null
mkdir /tmp/root/root/dev 2> /dev/null
mkdir /tmp/root//root/bin 2> /dev/null
mkdir /tmp/root/root/sbin 2> /dev/null
mkdir /tmp/root/root/usr 2> /dev/null
mkdir /tmp/root/root/run 2> /dev/null
mkdir /tmp/root/root/proc 2> /dev/null
mkdir /tmp/root/root/sys 2> /dev/null
mkdir /tmp/root/proc 2> /dev/null
mkdir /tmp/root/sys 2> /dev/null
mkdir /tmp/root/boot 2> /dev/null
mkdir /tmp/root/run 2> /dev/null
chmod 777 /tmp/root/* 2> /dev/null

genisoimage -o "$h" -input-charset utf-8 -b "isolinux.bin" -no-emul-boot -boot-load-size 4  -boot-info-table "/tmp/root"
chmod 777 $h
