# Se espera que los archivos .cer esten guardados en la ruta w:\
# Se recoge el nombre de los archivos "certnew (XXX).cer" en variable, 
# para cambiar la estrutura del nombre, modificar X en "where name -match X"
$RutaArchivosCA = "\\172.20.140.254\software.domi.com\CA\"


$var = ls $RutaArchivosCA
#$var = (ls $RutaArchivosCA | select name | where name -match "certnew \(\d\d\d\)\.cer").name
write-host "--"  $var


# la linea comentada los importaria en el contenedor de entidades de certificacion de raiz de confianza
foreach ($lin in $var) {
write-host $RutaArchivosCA$lin
    Import-Certificate -FilePath $RutaArchivosCA$lin -CertStoreLocation Cert:\LocalMachine\Root
}


# El bucle importa los certificados en el equipo local en el contenedor personal, 
#foreach ($lin in $var) {Import-Certificate -FilePath "w:\$lin" -CertStoreLocation Cert:\LocalMachine\My}

# Para importarlos en otro lugar cambiar "Cert:\LocalMachine\My". "Cert:\CurrentUser\My"
# los importa en el contenedor personal del usuario activo por ejemplo