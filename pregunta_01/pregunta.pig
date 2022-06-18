/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- carga de datos desde la carpeta local
data = LOAD 'data.tsv' AS ( col1:chararray, col2:chararray, col3:int);
letter = FOREACH data GENERATE col1 as let;
-- agrupa los registros que tienen la misma palabra
grouped = GROUP letter BY let;
-- genera una variable que cuenta 
wordcount = FOREACH grouped GENERATE group, COUNT(letter);
STORE wordcount INTO 'output' USING PigStorage(',');