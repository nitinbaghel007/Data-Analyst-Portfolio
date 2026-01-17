import pandas as pd

# CSV file ka path
file_path = "data/retail_sales.csv"

# CSV ko read karna
df = pd.read_csv(file_path)

# Data ke first 5 rows dekhna
print(df.head())
