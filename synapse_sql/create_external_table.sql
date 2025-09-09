CREATE EXTERNAL TABLE tiktok.tiktok_user 
WITH (
    DATA_SOURCE = source_gold,
    LOCATION = 'Tiktok_data',
    FILE_FORMAT = format_parquet
)
AS 
SELECT * FROM tiktok.view_tiktok

SELECT * FROM tiktok.tiktok_user;

