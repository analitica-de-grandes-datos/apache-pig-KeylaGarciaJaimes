/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

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
dic = FOREACH data GENERATE FLATTEN(dic_) AS letter;   
grouped = GROUP dic BY letter;
wordcount = FOREACH grouped GENERATE group, COUNT(dic);
STORE wordcount INTO 'output' USING PigStorage(',');
