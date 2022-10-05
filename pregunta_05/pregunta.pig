/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (
        letter:chararray, 
        tupla_:BAG{A:tuple(B:chararray)}, 
        dic_:chararray
    );
let = FOREACH data GENERATE FLATTEN(tupla_.B) AS minus;
grouped = GROUP let BY minus;
wordcount = FOREACH grouped GENERATE group, COUNT(let);
STORE wordcount INTO 'output' USING PigStorage(',');
