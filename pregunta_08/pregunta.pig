/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

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
col = FOREACH data GENERATE FLATTEN(tupla_) AS letter, FLATTEN(dic_) as map_r;
joined = FOREACH col GENERATE(letter,map_r) as tuple_data;
grouped = GROUP joined BY tuple_data;
wordcount = FOREACH grouped GENERATE group, COUNT(joined);
STORE wordcount INTO 'output' USING PigStorage(',');

