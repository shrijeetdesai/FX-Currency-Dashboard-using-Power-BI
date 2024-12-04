import yfinance as yf
import pandas as pd
import datetime

# Define the currency pairs and start/end dates
currency_pairs = {
    "INR-GBP": "INRGBP=X",
    "AUD-GBP": "AUDGBP=X",
    "CAD-GBP": "CADGBP=X",
    "CNY-GBP": "CNYGBP=X",
    "USD-GBP": "USDGBP=X"
}
start_date = "1970-01-01"
end_date = "2022-12-31"

# Create a DataFrame to store the results
all_data = pd.DataFrame()

# Loop through each currency pair
for pair_name, ticker in currency_pairs.items():
    # Fetch historical data
    data = yf.download(ticker, start=start_date, end=end_date, interval='1mo')  # Monthly data
    data['Year'] = data.index.year
    annual_data = data.groupby('Year')['Close'].mean()  # Calculate annual average close prices
    all_data[pair_name] = annual_data

# Reset index for a cleaner DataFrame
all_data.reset_index(inplace=True)
all_data.rename(columns={'index': 'Year'}, inplace=True)

# Display the final DataFrame
print(all_data)

# Save to a CSV file
all_data.to_csv("currency_exchange_rates_1970_2022.csv", index=False)
