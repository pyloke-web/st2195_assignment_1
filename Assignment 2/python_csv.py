#Web scraping a table from Wikipedia
import requests #for HTTP request
from bs4 import BeautifulSoup #scraping data from HTML and XML files
import pandas as pd

url = requests.get('https://en.wikipedia.org/wiki/Comma-separated_values#Example').text #access url
soup = BeautifulSoup(url,'lxml')

My_table = soup.find("table",{"class":"wikitable"}) #access specific table with class wikitable
df = pd.read_html(str(My_table)) #list object

dfs = df[0] #printing as dataframe objet
dfs.to_csv('C:/Users/user/OneDrive - JLYON/Documents/stats/cardf3.csv')
