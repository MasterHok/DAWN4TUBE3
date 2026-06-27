//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# DAWN4TUBE3
Codigo para Descargar de Youtube aprovechando la librerias YT-DLP,FFMPEG y NODE

Este Script no toca ni cambia ni agrega nada raro al sistema Operativo Windows, solo necesita los archivos necesarios en sus subcarpetas, es totalmente portable y solo "vive" en la carpeta donde lo alojen.

ANTES DE TODO SI GUSTAN REVISEN EL CODIGO O PREGUNTEN A UNA IA DE SU PREFERENCIA SOBRE EL COMPORTAMIENTO DE LOS 2
CODIGOS DE LOS SCRIPTS QUE NECESITAREMOS EN ESTE PROYECTO. ES MAS DIVERTIDO ASI =).

PARTE 1

PASO 1= INSTALAR FIREFOX e INICIAR SESION con una Cuenta GOOGLE y mirar un video de YOUTUBE.,
una vez echo esto pueden cerrar el navegador, no es necesario mantenerlo abierto
(_Este SCRIPT necesita SI o SI el navegador FIREFOX, pero puede cambiarse por CHROME por ejemplo).

PASO 2= CREAR una carpeta con el nombre y ubicacion de tu PREFERENCIA.,

EJEMPLO = DAWN4TUBE2 

...para el resto del tutorial nos referiremos a esta carpeta como RAIZ.

PASO 3= DESCARGAR NODE.JS del siguiente LINK ( es DESCARGA DIRECTA):

https://nodejs.org/dist/v24.15.0/node-v24.15.0-win-x64.zip

... si aun no lo tienen necesitaran Instalar WIN-RAR: 

https://d.winrar.es/d/101z1777156778/SYbRhxr2NpR8jipmxU9-uQ/winrar-x64-720.exe). 

...cuando termine la descarga DESCOMPRIREMOS el archivo "node-v24.15.0-win-x64.zip", esto dejara una carpeta llamada: "node-v24.15.0-win-x64" la cual moveremos a la carpeta RAIZ y una ves dentro cambiaremos el nombre de la carpeta : "node-v24.15.0-win-x64" a "r"

EJEMPLO = ~/RAIZ/r/

PARTE 2,

PASO 1= Dentro de la carpeta RAIZ crearemos un nuevo documento de texto, no importa el nombre (al final podremos borrarlo) . abriremos el documento de texto y pegaremos el codigo de INSTALADOR.bat( o pueden descargar o clonar este repositorio si lo prefieren).

Una vez guardado le daremos DOBLE CLICK y se abrira una ventana CMD ( es normal) y comenzara a descargar los 2 ultimos ARCHIVOS CLAVE para este SCRIPT ( juntos pesan menos de 150 Mb ) , uno es ytdlp.exe y el otro es ffmpeg.exe , 

... una vez termine la descarga la terminal de CMD deberia decir que todo esta Ok .

PASO 2= Este es el ultimo PASO, ahora crearemos el SCRIPT principal, crearemos un nuevo DOCUMENTO DE TEXTO y en el Pegaremos el contenido de DESCARGADOR.bat(igualmente pueden descargarlo si gustan):,

... daremos a click en Archivo y en Guardar como: y recuerden ponerle al final .bat EJEMPLO= DESCARGADOR.bat. 

Y listo eso es todo  solo queda darle doble click y seguir las instrucciones de descarga, si todo salio bien deberian poder descargar video de Youtube a su gusto. 

Ahora pueden borrar el archivo Instalador.bat o como le hayan puesto y tambien el archivo .txt que crearon para generar los .bat.,

.. en su carpeta RAIZ deberia verse asi :

-Una carpeta con el nombre  "r"
-Un archivo llamado DESCARGADOR.bat o el nombre que le pusieron al descargador.
-Un archivo llamado Instalador.bat (Opcionaal , pueden borrarlo ya no lo necesitaran)
-Un archivo probablemente llamado "Nuevo Documento de Texto.txt" (no lo necesitan pueden borrarlo).

... una ves usen el descargador se generaran dos carpetas nuevas :

-DESCARGAS donde estaran los MP4, MP3 y PORTADAS
-TEMP que es la carpeta donde trabaja el Script para las conversiones, puede que no la vean ya que se espera que el SCRIPT la elimine al terminar de trabajar.

Este SCRIPT solo descarga videos de 1 por 1 no descarga listas completas de YOUTUBE pero con un ligero cambio en el codigo pueden lograrlo.,

Este SCRIPT puede dejar de FUNCIONAR con el tiempo, debedido a cambios con YOUTUBE, pero de igual forma recomiendo no borrarlo ya que tambien puede que con el tiempo vuelva a FUNCIONAR. Resumidamente puede que por PERIODOS deje de Funcionar.



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
