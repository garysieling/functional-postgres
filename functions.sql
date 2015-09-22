CREATE AGGREGATE flatMap (anyarray)
(
    sfunc = array_cat,
    stype = ANYARRAY,
    initcond = '{}'
);

-- http://stackoverflow.com/questions/3994556/eliminate-duplicate-array-values-in-postgres
CREATE OR REPLACE FUNCTION uniq (ANYARRAY) RETURNS ANYARRAY
LANGUAGE SQL
AS $body$
  SELECT ARRAY(
    SELECT DISTINCT $1[s.i]
    FROM generate_series(array_lower($1,1), array_upper($1,1)) AS s(i)
    ORDER BY 1
  );
$body$;
