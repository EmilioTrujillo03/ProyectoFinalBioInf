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

**NANO** : Editor de texto sencillo de usar para, con _Regular expressions_, cambiar el nombre científico y evitar problemas en los análisis.

Este proyecto se realizará dentro de una supercomputadora ubicada en UCLA. Las credenciales y claves son 
secretas, por lo que no se especificarán en este Markdown.

Pasos adicionales:

* Crear un directorio llamado "VirolaPhylogenetics", donde se depositarán los análisis.

* Para mantener el orden, crear dentro tres directorios más:

1. IQTREE : Donde se depositarán las filogenias.
2. MUSCLE : Donde se depositarán los alineamientos.
3. RAWDATA : Donde estarán las secuencias crudas.

---

#### **Instalación**

---

*Dentro de Hoffmann* ->

**Pedir un nodo computacional y memoria:** qrsh h_data=30G;h_vmem=30G

Para cargar los programas:

MUSCLE : module load 

IQTree : module load

#### **Comandos utilizados**

---

**Obtener las secuencias del NCBI**

**¡Paréntesis!** -> En este paso utilizar NANO para reducir el nombre a algo más sencillo con _regular expressions_

Utilizar: 

**Alinear las secuencias con MUSCLE**

**Realizar una filogenia con IQTree**

Los resultados obtenidos de estos comandos hay que guardarlos en las carpetas correspondientes (automatizado en el script the Bash que se encuentra
más abajo.

---

### **Script .sh**

**Script consenso (para ejecutar una sola vez)**

---

### **Visualización en IQTree**

#### **Referencias**

---









