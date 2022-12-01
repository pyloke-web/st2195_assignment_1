#!/usr/bin/env python
# coding: utf-8

# In[4]:


import requests #for HTTP request
from bs4 import BeautifulSoup #scraping data from HTML and XML files
url = requests.get('https://en.wikipedia.org/wiki/Comma-separated_values#Example').text #access url


# In[6]:


soup = BeautifulSoup(url,'lxml')
My_table = soup.find("table",{"class":"wikitable"}) #access specific table with class wikitable
My_table


# In[8]:


import pandas as pd
df = pd.read_html(str(My_table))
print(df) #printing list object


# In[22]:

dfs = df[0] #printing as DF objet
dfs
dfs.to_csv('C:/Users/user/OneDrive - JLYON/Documents/stats/cardf3.csv')


# In[21]:




