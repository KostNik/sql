-- view table information
SELECT cols.TABLE_NAME,
       cols.COLUMN_NAME,
       cols.ORDINAL_POSITION,
       cols.COLUMN_DEFAULT,
       cols.IS_NULLABLE,
       cols.DATA_TYPE,
       cols.CHARACTER_MAXIMUM_LENGTH,
       cols.CHARACTER_OCTET_LENGTH,
       cols.NUMERIC_PRECISION,
       cols.NUMERIC_SCALE,
       cols.COLUMN_TYPE,
       cols.COLUMN_KEY,
       cols.EXTRA,
       cols.COLUMN_COMMENT,
       refs.REFERENCED_TABLE_NAME,
       refs.REFERENCED_COLUMN_NAME,
       cRefs.UPDATE_RULE,
       cRefs.DELETE_RULE,
       links.TABLE_NAME,
       links.COLUMN_NAME,
       cLinks.UPDATE_RULE,
       cLinks.DELETE_RULE
FROM INFORMATION_SCHEMA.`COLUMNS` as cols
       LEFT JOIN INFORMATION_SCHEMA.`KEY_COLUMN_USAGE` AS refs
                 ON refs.TABLE_SCHEMA = cols.TABLE_SCHEMA
                   AND refs.REFERENCED_TABLE_SCHEMA = cols.TABLE_SCHEMA
                   AND refs.TABLE_NAME = cols.TABLE_NAME
                   AND refs.COLUMN_NAME = cols.COLUMN_NAME
       LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS cRefs
                 ON cRefs.CONSTRAINT_SCHEMA = cols.TABLE_SCHEMA
                   AND cRefs.CONSTRAINT_NAME = refs.CONSTRAINT_NAME
       LEFT JOIN INFORMATION_SCHEMA.`KEY_COLUMN_USAGE` AS links
                 ON links.TABLE_SCHEMA = cols.TABLE_SCHEMA
                   AND links.REFERENCED_TABLE_SCHEMA = cols.TABLE_SCHEMA
                   AND links.REFERENCED_TABLE_NAME = cols.TABLE_NAME
                   AND links.REFERENCED_COLUMN_NAME = cols.COLUMN_NAME
       LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS cLinks
                 ON cLinks.CONSTRAINT_SCHEMA = cols.TABLE_SCHEMA
                   AND cLinks.CONSTRAINT_NAME = links.CONSTRAINT_NAME
WHERE cols.TABLE_SCHEMA = DATABASE()
  AND cols.TABLE_NAME = "employees";

