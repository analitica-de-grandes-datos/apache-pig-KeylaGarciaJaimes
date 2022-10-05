/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS ( col1:chararray, col2:chararray, col3:int);
numero = FOREACH data GENERATE col3 as num;
sr = ORDER numero BY num ASC;
s = LIMIT sr 5;
STORE s INTO 'output' USING PigStorage(',');