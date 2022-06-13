/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
-- carga de datos desde la carpeta local
data = LOAD 'data.tsv' AS ( col1:chararray, col2:chararray, col3:int);
SR = ORDER data BY col1 ASC, col3 ASC;
STORE SR INTO 'output' USING PigStorage(',');