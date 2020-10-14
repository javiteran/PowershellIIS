#https://docs.microsoft.com/en-us/powershell/module/pkiclient/import-certificate?view=win10-ps
##Cargar un certificado de una CA (autoridad certificador) en la carpeta de 
#"Certificados Raiz de Confianza" del "Equipo local"

Import-Certificate -Filepath "C:\temp\cert" -CertStoreLocation "Cert:\LocalMachine\Root" 


#Para saber la localizaciones puedes utilizar el comando
#Set-Location cert:
#y ejecutar dir

#Se podría importar un certificado de usuario .pfx

#Import-PfxCertificate -CertStoreLocation  "fichero.pfx"