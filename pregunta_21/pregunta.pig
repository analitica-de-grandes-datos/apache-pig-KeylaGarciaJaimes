/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u
   WHERE 
       color REGEXP 'blue|green';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (
        num:int, 
        name:chararray, 
        last_name:chararray,
        date: chararray,
        color: chararray,
        num2:int
    );
Color = FOREACH data GENERATE name, color;
Filtro = FILTER Color BY (color=='blue') or (color=='green');
STORE Filtro INTO 'output' USING PigStorage(',');
