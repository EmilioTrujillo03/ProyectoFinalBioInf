### **Filogenia preliminar del género *Virola* y su ubicación dentro del orden Magnoliales utilizando rbcl**

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
de toda la familia, y el más grande dentro de la familia en el neotrópico (Santamaría-Aguilar et al. 2019;Santamaría-Aguilar and Lagomarsino 2022).

---

![*Virola megacarpa*, extraído de: https://phytokeys.pensoft.net/article/37979/zoom/fig/120/](https://phytokeys.pensoft.net/showimg/oo_349102.jpg)

---

Si bien han existido múltiples revisiones taxonómicas del género, pocos han sido los estudios
que intenten resolver las relaciones evolutivas del género. Por ello, cuestiones taxonómicas artificiales
como establecer clasificaciones infragenéricas se vuelven más complicadas.

Debido al actual estado del conocimiento del género, es indispensable comenzar a trabajar en entender
las relaciones que tienen las ~70 especies de *Virola* que existen en Centro y Suramérica. Por ello, este trabajo 
tiene como objetivo realizar una filogenia preliminar del género en base a un marcador molecular cloroplástico (rbcl).

---

#### **Prerequisitos (programas necesarios)**

---

**MUSCLE v5** (Edgar 2021) : Para el alineamiento de las secuencias.

**IQTREE v1.2.2** (Minh et al. 2020) : Para la construcción del árbol filogenético.

**FigTree v1.4.4** : Para la visualización del árbol.

**ATOM**: Editor de texto sencillo de usar para, con _Regular expressions_, cambiar el nombre científico y evitar problemas en los análisis.

Este proyecto se realizará dentro de una supercomputadora ubicada en UCLA. Las credenciales y claves son 
confidenciales, por lo que no se especificarán en este Markdown.

---

#### **Script explicado comando por comando:**

---


#### **Parte I:** *descarga de los datos*

**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Virola[ORGN]" | efetch -format fasta > rbcl-Virola.fasta**

**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Virola[ORGN]" | efetch -format fasta > rbcl-Virola.fasta**

**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Osteophloeum[ORGN]" | efetch -format fasta > rbcl-Osteophloeum.fasta**

**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Compsoneura[ORGN]" | efetch -format fasta > rbcl-Compsoneura.fasta**

**/u/scratch/d/dechavez/Bioinformatica-PUCE/MastBio/edirect/esearch -db nuccore -query "rbcl [GENE] AND Duguetia[ORGN]" | efetch -format fasta > rbcl-Duguetia.fasta**

Estas líneas funcionan para descargar todas las secuencias existentes de gen (rbcl) para un un género (en este caso *Virola*, *Compsoneura*, *Osteophloeum* y *Duguetia*). Todas las
secuencias son en formato FASTA y están en archivos separados, los cuales posteriormente tendremos que unir para analizarlos.

Como queremos ver la posición filogenética de *Virola*, descargamos los otros dos grupos hermanos *Osteophloeum* y *Compsoneura* que pertenecen a 
la misma familia Myristicaceae. Asimismo, descargamos las secuencias del grupo externo, en este caso una Annonaceae del género *Duguetia*, que pertenece
al mismo orden, pero no a la misma familia.

---

#### **Parte II**: *alineamiento de los datos y árboles filogenéticos*

**cat rbcl-Compsoneura.fasta rbcl-Duguetia.fasta rbcl-Osteophloeum.fasta rbcl-Virola.fasta > MatrizMagnoliales.fasta**

**./muscle3.8.31_i86linux64 -in MatrizMagnoliales.fasta -out MatrizMagnolialesALN.fasta**

Con esta serie de comandos lo que realizamos es juntar nuestros diferentes FASTA descargados para cada
género y unificarlos con la función *cat*. Así, creamos un único FASTA que contiene los cuatro géneros que
queremos analizar. Posteriormente, utilizamos la línea llamando al programa MUSCLE para que ejecute el
alineamiento de las secuencias.

---

**Parte III**: edición de los nombres en ATOM (descarga de datos y subida de datos)

**scp **direccióncorreo**:/u/scratch/d/dechavez/Bioinformatica-PUCE/RediseBio/EmilioTR/ProyectoFinal/MatrizMagnolialesALN.fasta ./**

Luego de abrir en el editor de texto ATOM, vamos a FIND en la barra de herramientas, seleccionamos REPLACE IN BUFFER y allí dentro
presionamos el botón de REGULAR EXPRESSIONS (.*), posteriormente en la barra inferior colocamos en FIND las siguientes expresiones:

^>?(\w+\.\d+)\s+([A-Z][a-z]+)\s+([a-z]+).*

y en REPLACE colocamos:

>$1_$2_$3

Así, obtenemos el nombre de cada taxón más simplificado para que los análisis filogenéticos no se tropiecen. El resultado sería, por ejemplo:

>AY738160.1_Duguetia_guianensis

Posteriormente, volvemos a cargar el FASTA editado en la carpeta donde trabajamos en el supercomputador:

**scp (ARCHIVO) (DIRECCIÓN DE CORREO CON CARPETA ESPECIFICADA)**

---

#### **Parte IV**: construcción del árbol filogenético

iqtree -s MatrizMagnolialesALN.fasta -o AY738160.1_Duguetia_guianensis -m HKY+I+G4 -bb 1000 -minsup 0.5

Aquí ejecutamos el programa IQTREE, específicando con la función *-s* nuestro archivo, con *-o* nuestro grupo externo, con *-m* nuestro
modelo evolutivo, con *-bb* el número de bootstraps que estamos estableciendo y con *-minsup* que todo valor de soporte menor al 50% sea
arrojado como una politomía.

Luego de obtener varios archivos .tree, descargaremos el que termina en .treefile dentro de nuestro escritorio con los comandos utilizados en la
parte III. Esto lo visualizaremos en Figtree dentro de nuestro computadores.

---

#### **Restulados de la filogenia**


![Filogenia de *Virola* en relación con sus grupos hermanos](https://github.com/EmilioTrujillo03/ProyectoFinalBioInf/blob/main/VirolaFilogenia.jpg?raw=true)

---


Esta ejecución nos permite ver, de manera preliminar, la posición filogenética que tiene *Virola* dentro de 
la familia Myristicaceae y el orden Magnoliales. Se puede observar que Myristicaceae, con los géneros escogido,
forma un clado monofilético con un valor de soporte de 100. Dentro del clado el soporte varía, pero se puede ver
que el género *Osteophloeum* es el que está más relacionado con *Virola*, y que ambos se encuentran dentro de 
un gran grupo que consta del género *Compsoneura*.

Obviamente, estos datos son extremadamente preliminares debido al uso de únicamente un gen. Esta pequeña aproximación
nos puede dar una idea de pocas relaciones, pero se necesita un muestreo más exhaustivo del género y sus grupos
hermanos para poder construir una filogenia más informativa. Asimismo, lo ideal sería utilizar técnicas de
secuenciamiento de siguiente generación para obtener datos más completos.

*Virola* es un género que tiene aún mucho trabajo por delante, y su conocimiento nos ayudará a comprender la
evolución, relación y dinámicas biogeográficas de la familia Myristicaceae y el orden Magnoliales en el neotrópico.

---

#### **Referencias**

---

Edgar, R. C. (2021). MUSCLE v5 enables improved estimates of phylogenetic tree confidence by ensemble bootstrapping, bioRxiv 2021.06.20.449169. https://doi.org/10.1101/2021.06.20.449169.

Minh, B. Q., Schmidt, H. A., Chernomor, O., Schrempf, D., Woodhams, M. D., Von Haeseler, A., and Lanfear, R. (2020). IQ-TREE 2: New Models and Efficient Methods for Phylogenetic Inference in the Genomic Era. Molecular Biology And Evolution, 37(5), 1530-1534. https://doi.org/10.1093/molbev/msaa015

Santamaría-Aguilar, D., Aguilar, R., and Lagomarsino, L. P. (2019). A taxonomic synopsis of *Virola* (Myristicaceae) in Mesoamerica, including six new species. PhytoKeys, 134, 1-82. https://doi.org/10.3897/phytokeys.134.37979

Santamaría-Aguilar, D., & Lagomarsino, L. P. (2022). New Species of *Virola* (Myristicaceae) from South America. PhytoKeys, 197, 81-148. https://doi.org/10.3897/phytokeys.197.81367



