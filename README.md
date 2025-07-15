### **Filogenia preliminar del género *Virola* utilizando rbcl**

---

Elaborado por: Emilio J. Trujillo (ejtrujillo@puce.edu.ec)

---

Este proyecto busca construir una filogenia preliminar del género *Virola*,
perteneciente a la familia Myristicaceae. Se utilizarán datos obtenidos del
GenBank los cuales son de estudios previos en la familia y el género.

---

#### **Introducción**

---

*Virola* Aubl. (Myristicaceae) es un género de ábroles neotropicales con
importancia ecológica, económica y cultural. Es el cuarto género más grande
de toda la familia, y el más grande dentro de la familia en el neotrópico (Santamaría-Aguilar 2022).

---

![*Virola megacarpa*, extraído de: https://phytokeys.pensoft.net/article/37979/zoom/fig/120/](https://phytokeys.pensoft.net/showimg/oo_349102.jpg)

---

Si bien han existido múltiples revisiones taxonómicas del género (citas), pocos han sido los estudios
que intenten resolver las relaciones evolutivas del género (). Por ello, cuestiones taxonómicas artificiales
como establecer clasificaciones infragenéricas se vuelven más complicadas.

Debido al actual estado del conocimiento del género, es indispensable comenzar a trabajar en entender
las relaciones que tienen las ~70 especies de *Virola* que existen en Centro y Suramérica. Por ello, este trabajo 
tiene como objetivo realizar una filogenia preliminar del género en base a un marcador molecular cloroplástico (rbcl).

---

#### **Prerequisitos (programas necesarios)**

---

**MUSCLE v5** (Edgar 2021) : Para el alineamiento de las secuencias.

**IQTREE v1.2.2** (Wong 2025) : Para la construcción del árbol filogenético.

**FigTree v1.4.4** () : Para la visualización del árbol.

**ATOM**: Editor de texto sencillo de usar para, con _Regular expressions_, cambiar el nombre científico y evitar problemas en los análisis.

Este proyecto se realizará dentro de una supercomputadora ubicada en UCLA. Las credenciales y claves son 
secretas, por lo que no se especificarán en este Markdown.

---

#### **Script explicado comando por comando:**

<span style="color:green">**Texto verde se refiere a comandos**

**Texto negro es la explicación**

---


#### **Parte I:** descarga de los datos


<span style="color:green">**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Virola[ORGN]" | efetch -format fasta > rbcl-Virola.fasta**

<span style="color:green">**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Osteophloeum[ORGN]" | efetch -format fasta > rbcl-Osteophloeum.fasta**

<span style="color:green">**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Compsoneura[ORGN]" | efetch -format fasta > rbcl-Compsoneura.fasta**

<span style="color:green">**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Duguetia[ORGN]" | efetch -format fasta > rbcl-Duguetia.fasta**

Estas líneas funcionan para descargar todas las secuencias existentes de gen (rbcl) para un un género (en este caso *Virola*, *Compsoneura*, *Osteophloeum* y *Duguetia*). Todas las
secuencias son en formato FASTA y están en archivos separados, los cuales posteriormente tendremos que unir para analizarlos.

Como queremos ver la posición filogenética de *Virola*, descargamos los otros dos grupos hermanos *Osteophloeum* y *Compsoneura* que pertenecen a 
la misma familia Myristicaceae. Asimismo, descargamos las secuencias del grupo externo, en este caso una Annonaceae del género *Duguetia*, que pertenece
al mismo orden, pero no a la misma familia.

---

#### **Parte II**: alineamiento de los datos y árboles filogenéticos

<span style="color:green">**cat rbcl-Compsoneura.fasta rbcl-Duguetia.fasta rbcl-Osteophloeum.fasta rbcl-Virola.fasta > MatrizMagnoliales.fasta**

<span style="color:green">**./muscle3.8.31_i86linux64 -in MatrizMagnoliales.fasta -out MatrizMagnolialesALN.fasta**

---

**Parte III**: edición de los nombres en ATOM (descarga de datos y subida de datos)

<span style="color:green">**scp **direccióncorreo**:/u/scratch/d/dechavez/Bioinformatica-PUCE/RediseBio/EmilioTR/ProyectoFinal/MatrizMagnolialesALN.fasta ./**

Luego de abrir en el editor de texto ATOM, vamos a FIND en la barra de herramientas, seleccionamos REPLACE IN BUFFER y allí dentro
presionamos el botón de REGULAR EXPRESSIONS (.*), posteriormente en la barra inferior colocamos en FIND las siguientes expresiones:

^>?(\w+\.\d+)\s+([A-Z][a-z]+)\s+([a-z]+).*

y en REPLACE colocamos:

>$1_$2_$3

Así, obtenemos el nombre de cada taxón más simplificado para que los análisis filogenéticos no se tropiecen. El resultado sería, por ejemplo:

>AY738160.1_Duguetia_guianensis

---

#### **Parte IV**: construcción del árbol filogenético

<span style="color:green">iqtree -s MatrizMagnolialesALN.fasta -o AY738160.1_Duguetia_guianensis -m HKY+I+G4 -bb 1000 -minsup 0.5

Aquí ejecutamos el programa IQTREE, específicando con la función *-s* nuestro archivo, con *-o* nuestro grupo externo, con *-m* nuestro
modelo evolutivo, con *-bb* el número de bootstraps que estamos estableciendo y con *-minsup* que todo valor de soporte menor al 50% sea
arrojado como una politomía.

Luego de obtener varios archivos .tree, descargaremos el que termina en .treefile dentro de nuestro escritorio con los comandos utilizados en la
parte III. Esto lo visualizaremos en Figtree dentro de nuestro computadores.

---

#### **Restulados de la filogenia**


![Filogenia de *Virola* en relación con sus grupos hermanos](https://github.com/EmilioTrujillo03/ProyectoFinalBioInf/blob/main/VirolaFilogenia.jpg?raw=true)

DISCUTIIIIRRRRRR


---

#### **Referencias**

---

AGREGAAARRRRRR







