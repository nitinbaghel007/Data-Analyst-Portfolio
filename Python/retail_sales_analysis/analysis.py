import pandas as pd

# CSV file ka path
file_path = "data/retail_sales.csv"

# CSV ko read karna
df = pd.read_csv(file_path)

# Data ke first 5 rows dekhna
print(df.head())
# Step 2.1: Data ka shape (rows, columns)
print("Shape of data:", df.shape)

# Step 2.2: Column names
print("\nColumn names:")
print(df.columns)

# Step 2.3: Data types
print("\nData types:")
print(df.dtypes)

# Step 2.4: Basic information
print("\nData info:")
print(df.info())
# Step 3.1: Missing values check
print("\nMissing values in each column:")
print(df.isnull().sum())
# Step 3.2: Convert visit_date to datetime
df['visit_date'] = pd.to_datetime(df['visit_date'])

print("\nAfter date conversion:")
print(df.dtypes)
# Step 3.3: Extract year, month, day from visit_date
df['year'] = df['visit_date'].dt.year
df['month'] = df['visit_date'].dt.month
df['day'] = df['visit_date'].dt.day

print("\nDate features added:")
print(df[['visit_date', 'year', 'month', 'day']].head())

# Step 3.1: Total sales
total_sales = df['total_amount'].sum()

print("Total Sales:", total_sales)

# Step 3.2: Store type wise total sales
store_type_sales = df.groupby('store_type')['total_amount'].sum()

print("Store Type Wise Sales:")
print(store_type_sales)

# Step 3.3: City wise total sales
city_sales = df.groupby('city')['total_amount'].sum().sort_values(ascending=False)

print("City Wise Sales:")
print(city_sales)

# Step 3.4: Top customers by total spend
top_customers = (
    df.groupby('customer_name')['total_amount']
    .sum()
    .sort_values(ascending=False)
)

print("Top Customers by Total Spend:")
print(top_customers)

# Step 3.5: Daily sales trend
daily_sales = df.groupby('visit_date')['total_amount'].sum()

print("Daily Sales Trend:")
print(daily_sales)

# Step 4: Key insights summary
print("\nKey Insights:")
print("- Mall stores generate higher revenue than Local stores.")
print("- Delhi and Agra are top performing cities.")
print("- A small number of customers contribute a large portion of sales.")
print("- Sales vary significantly across different days.")
