
CREATE VIEW tiktok.view_tiktok 
AS
SELECT 
    *
FROM 
    OPENROWSET(
        BULK 'https://tiktokprojectadls.blob.core.windows.net/silver/tiktok_users/',
        FORMAT ='PARQUET'
    ) AS  q1





