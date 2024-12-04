import requests
import pandas as pd
from datetime import datetime

# Define countries and indicators
countries = ['IND', 'GBR', 'AUS', 'CAN', 'USA', 'CHN']
indicators = {
    'GDP growth (annual %)': 'NY.GDP.MKTP.KD.ZG',
    'Inflation, consumer prices (annual %)': 'FP.CPI.TOTL.ZG'
}

# Define date range
start_date = 2003
end_date = 2022

# Base API URL
base_url = "http://api.worldbank.org/v2/country/{country}/indicator/{indicator}?date={start}:{end}&format=json"

# Initialize a list to collect data
data_frames = []

# Fetch data for each indicator and country
for indicator_name, indicator_code in indicators.items():
    for country in countries:
        # Format the API URL
        url = base_url.format(country=country, indicator=indicator_code, start=start_date, end=end_date)
        response = requests.get(url)
        
        if response.status_code == 200:
            data = response.json()
            if len(data) > 1 and isinstance(data[1], list):
                records = data[1]
                for record in records:
                    data_frames.append({
                        'Date': record['date'],
                        'Country': country,
                        'Indicator': indicator_name,
                        'Value': record['value']
                    })
        else:
            print(f"Failed to fetch data for {country}, {indicator_name}. HTTP Status Code: {response.status_code}")

# Convert the list of dictionaries to a DataFrame
raw_data = pd.DataFrame(data_frames)

# Pivot the data to organize by indicator and country
gdp_data = raw_data[raw_data['Indicator'] == 'GDP growth (annual %)'].pivot(index='Date', columns='Country', values='Value').add_prefix('GDP_')
inflation_data = raw_data[raw_data['Indicator'] == 'Inflation, consumer prices (annual %)'].pivot(index='Date', columns='Country', values='Value').add_prefix('InflationRate_')

# Merge GDP and Inflation data
final_data = pd.concat([gdp_data, inflation_data], axis=1).reset_index()

# Renaming columns to match the required format
final_data.rename(
    columns={
        'GDP_IND': 'IND_GDP', 'InflationRate_IND': 'IND_InflationRate',
        'GDP_GBR': 'GBR_GDP', 'InflationRate_GBR': 'GBR_InflationRate',
        'GDP_AUS': 'AUS_GDP', 'InflationRate_AUS': 'AUS_InflationRate',
        'GDP_CAN': 'CND_GDP', 'InflationRate_CAN': 'CND_InflationRate',
        'GDP_USA': 'USD_GDP', 'InflationRate_USA': 'USD_InflationRate',
        'GDP_CHN': 'CHINA_GDP', 'InflationRate_CHN': 'CHINA_InflationRate'
    },
    inplace=True
)

# Save to a CSV file
final_data.to_csv("world_bank_gdp_inflation_2003_2022.csv", index=False)

# Display the DataFrame
print(final_data)
