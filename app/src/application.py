import os
import pymssql
from faker import Faker
import time
# Connection details
server = os.environ.get("SQLSERVER_SERVER")
database = os.environ.get("SQLSERVER_DATABASE")
username = os.environ.get("SQLSERVER_USERNAME")
password = os.environ.get("SQLSERVER_PASSWORD")

try:
    # Establish connection
    connection = pymssql.connect(server,username,password,database)

    # Create a cursor
    cursor = connection.cursor()
    
    # Create faker instance
    fake = Faker()
    
    # Define maximum lengths for each column
    max_lengths = {
        'AddressLine1': 60,
        'City': 30,
        'StateProvinceName': 50,
        'CountryRegionName': 50,
        'PostalCode': 15,
    }
    
    while True:
        # Generate fake data
        address_line1 = fake.street_address()[:max_lengths['AddressLine1']],
        city = fake.city()[:max_lengths['City']],
        state_province_name = fake.state()[:max_lengths['StateProvinceName']],
        country_region_name = fake.country()[:max_lengths['CountryRegionName']],
        postal_code = fake.zipcode()[:max_lengths['PostalCode']]

        # Prepare SQL insert statement
        sql = '''
            INSERT INTO SalesLT.Address(AddressLine1, City, StateProvince, CountryRegion, PostalCode)
            VALUES (%s, %s, %s, %s, %s);
        '''
        # Execute the insert statement
        cursor.execute(sql, (address_line1, city, state_province_name, country_region_name, postal_code))
        connection.commit()
        
        # Delay for 5 seconds
        time.sleep(5)
    


except pymssql.Error as e:
    print(f"Database error: {e}")