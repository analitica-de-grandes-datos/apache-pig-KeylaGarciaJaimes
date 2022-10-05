/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
salida.

   1971-07-08,08,8,jue,jueves
   1974-05-23,23,23,jue,jueves
   1973-04-22,22,22,dom,domingo
   1975-01-29,29,29,mie,miercoles
   1974-07-03,03,3,mie,miercoles
   1974-10-18,18,18,vie,viernes
   1970-10-05,05,5,lun,lunes
   1969-02-24,24,24,lun,lunes
   1974-10-17,17,17,jue,jueves
   1975-02-28,28,28,vie,viernes
   1969-12-07,07,7,dom,domingo
   1973-12-24,24,24,lun,lunes
   1970-08-27,27,27,jue,jueves
   1972-12-12,12,12,mar,martes
   1970-07-01,01,1,mie,miercoles
   1974-02-11,11,11,lun,lunes
   1973-04-01,01,1,dom,domingo
   1973-04-29,29,29,dom,domingo

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

read = FOREACH data GENERATE ToDate(date,'yyyy-MM-dd') as DATE;
data = FOREACH read GENERATE ToString(DATE, 'yyyy-MM-dd') as toda,                              
                              ToString(DATE, 'dd') as day, 
                              ToString(DATE, 'd') as nday,
                              LOWER(ToString(DATE, 'EEEE')) as dia,
                              LOWER(ToString(DATE, 'E')) as d;
data = FOREACH data GENERATE toda, day, nday, REPLACE(d,'thu','jue') AS d, REPLACE(dia,'thursday','jueves') AS dia;
data = FOREACH data GENERATE toda, day, nday, REPLACE(d,'sun','dom') AS d, REPLACE(dia,'sunday','domingo') AS dia;
data = FOREACH data GENERATE toda, day, nday, REPLACE(d,'fri','vie') AS d, REPLACE(dia,'friday','viernes') AS dia;
data = FOREACH data GENERATE toda, day, nday, REPLACE(d,'mon','lun') AS d, REPLACE(dia,'monday','lunes') AS dia;
data = FOREACH data GENERATE toda, day, nday, REPLACE(d,'tue','mar') AS d, REPLACE(dia,'tuesday','martes') AS dia;
data = FOREACH data GENERATE toda, day, nday, REPLACE(d,'wed','mie') AS d, REPLACE(dia,'wednesday','miercoles') AS dia;
STORE data INTO 'output' USING PigStorage(',');  

