CREATE AGGREGATE flatMap (anyarray)
(
    sfunc = array_cat,
    stype = ANYARRAY,
    initcond = '{}'
);
