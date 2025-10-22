CREATE OR REPLACE DATABASE SNOWPIPE;
CREATE OR REPLACE SCHEMA RETAIL_SALES;

CREATE OR REPLACE FILE FORMAT azure_csv_format
  TYPE = 'CSV'
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  SKIP_HEADER = 1;

CREATE OR REPLACE STAGE azure_sales_stage
  URL = 'azure://storagesaccounts1.blob.core.windows.net/monthly-sales'
  CREDENTIALS = (AZURE_SAS_TOKEN = 'sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2025-10-22T18:20:22Z&st=2025-10-22T10:05:22Z&spr=https&sig=%2FZqM2TSKB42aMjS5nnuMUnQ4ZlXAAMjFbdecscIJ988%3D')
  FILE_FORMAT = azure_csv_format;

LIST @azure_sales_stage;

SHOW STAGES LIKE 'azure_sales_stage';
