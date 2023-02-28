import pandas as pd
import matplotlib.pyplot as plt

# Load the data
df = pd.read_csv('googleplaystore.csv')

# Data cleaning
# Drop duplicate rows
df.drop_duplicates(subset='App', inplace=True)
print(df.columns)
# Convert 'Reviews', 'Size', and 'Price' columns to numeric data types
#df['Reviews'] = pd.to_numeric(df['Reviews'])
# create sample DataFrame
df['Reviews'] = pd.to_numeric(df['Reviews'], errors='coerce')
df['Size'] = df['Size'].apply(lambda x: str(x).replace('M', '') if 'M' in str(x) else x)
df['Size'] = df['Size'].apply(lambda x: str(x).replace(',', '') if ',' in str(x) else x)
df['Size'] = pd.to_numeric(df['Size'], errors='coerce')
df['Price'] = df['Price'].apply(lambda x: str(x).replace('$', '') if '$' in str(x) else x)
df['Price'] = pd.to_numeric(df['Price'], errors='coerce')

# Explore app categories
cat_counts = df['Category'].value_counts()
cat_counts.plot(kind='bar', figsize=(10, 6))
plt.title('Number of Apps by Category')
plt.xlabel('Category')
plt.ylabel('Number of Apps')
plt.show()

# Distribution of app ratings
df['Rating'].plot(kind='hist', bins=20, figsize=(10, 6))
plt.title('Distribution of App Ratings')
plt.xlabel('Rating')
plt.ylabel('Frequency')
plt.show()

# Distribution of app size
df['Size'].plot(kind='hist', bins=20, figsize=(10, 6))
plt.title('Distribution of App Sizes')
plt.xlabel('Size')
plt.ylabel('Frequency')
plt.show()

# Distribution of app price
df['Price'].plot(kind='hist', bins=20, figsize=(10, 6))
plt.title('Distribution of App Prices')
plt.xlabel('Price')
plt.ylabel('Frequency')
plt.show()



