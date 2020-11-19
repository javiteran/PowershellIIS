# Utilizar la versión del ISO no x86
$QueNombreSitio = "pru06"
$QueZona        ="domi.com"
$QueIP          = "2001::115"
#No tocar nada de aquí para abajo
$QueSitio       = "$QueNombreSitio.$QueZona"
$QueRuta        = "w:\www\$QueSitio\$QueSitio"
$QuePuerto      = 80


#Añade un registro DNS
Add-DnsServerResourceRecordAAAA -IPv6Address $QueIP -Name $QueNombreSitio -ZoneName $QueZona  -ComputerName 172.20.140.254

# Crea las carpetas, un archivo de inicio, el grupo de aplicaciones y el sitio.
mkdir $QueRuta
echo $QueSitio > $QueRuta"\index.html"
New-WebAppPool -Name $QueSitio -force
New-Website -Name $QueSitio -ApplicationPool $QueSitio -HostHeader $QueSitio -IPAddress * -PhysicalPath $QueRuta -Port $QuePuerto -Force