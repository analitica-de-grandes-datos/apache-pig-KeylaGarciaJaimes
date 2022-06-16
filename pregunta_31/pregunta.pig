/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

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
DATE = FOREACH data GENERATE date as fechas;
To_date = FOREACH DATE GENERATE ToDate(fechas,'yyyy-MM-dd') as (DT: DateTime);
str = FOREACH To_date GENERATE ToString(DT, 'yyyy') as birth_day;
group_by = GROUP str BY birth_day;
wordcount= FOREACH group_by GENERATE group, COUNT(str);
STORE wordcount INTO 'output' USING PigStorage(',');