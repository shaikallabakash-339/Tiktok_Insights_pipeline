CREATE SCHEMA tiktok;
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Allu@123'
CREATE DATABASE SCOPED CREDENTIAL cred_allu
WITH 
    IDENTITY ='Managed Identity'

---CREATE EXTERNAL DATA SOURCE
CREATE EXTERNAL DATA SOURCE source_silver
WITHs
(
    LOCATION ='https://tiktokprojectadls.blob.core.windows.net/silver/',
    CREDENTIAL= cred_allu
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://tiktokprojectadls.blob.core.windows.net/gold/',
    CREDENTIAL = cred_allu
)

-- create external file format

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

SELECT 
    *
FROM 
    OPENROWSET(
        BULK 'https://tiktokprojectadls.blob.core.windows.net/silver/tiktok_users/',
        FORMAT ='PARQUET'
    ) AS Quer1
