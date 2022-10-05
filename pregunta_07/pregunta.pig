/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (
        letter:chararray, 
        tupla_:BAG{A:tuple(B:chararray)}, 
        dic_:map[]
    );
counter = FOREACH data GENERATE letter, COUNT(tupla_.B) AS bag_r, SIZE(dic_) as map_r;
order_by = ORDER counter BY letter ASC,bag_r ASC,map_r ASC;
STORE order_by INTO 'output' USING PigStorage(',');