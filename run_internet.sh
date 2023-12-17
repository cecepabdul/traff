#!/bin/bash

# Nama folder master yang berisi isi yang akan disalin
master_folder="master"

# Menyalin isi dari Folder_master ke setiap folder
for i in {1..3}
do
    folder_name="internet_$i"

    # Membuat folder jika belum ada
    mkdir -p "$folder_name"

    # Menyalin isi dari Folder_master ke folder saat ini
    cp -r "$master_folder/." "$folder_name/"

    proxies_file="$folder_name/proxies.txt"
    sed -n "${i}p" proxy_list.txt > "$proxies_file"

    # Pindah ke folder dan jalankan perintah di dalamnya
    cd "$folder_name"
    sudo bash internetIncome.sh --start
    cd ..
done
