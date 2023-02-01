library(DBI)
conn <- dbConnect(RSQLite::SQLite(), "C:/Users/user/OneDrive - JLYON/Desktop/airline2.db")
dbListTables(conn)
dbListFields(conn, "ontime")

# Which of the following companies has the highest number of cancelled flights?
q1<- dbGetQuery (conn, 
          "SELECT carriers.Description, count(*) AS count
          FROM carriers JOIN ontime ON ontime.UniqueCarrier = carriers.Code
          WHERE ontime.Cancelled =1 
          GROUP BY carriers.Description
          ORDER BY count() DESC")
q1

# Which of the following airplanes has the lowest associated average departure delay (excluding cancelled and diverted flights)?
q2<- dbGetQuery (conn, 
                 "SELECT plane.model, avg(ontime.DepDelay)
                  FROM plane JOIN ontime USING(tailnum)
                  WHERE ontime.cancelled = 0 AND ontime.Diverted=0 AND ontime.DepDelay>0
                  GROUP BY model
                  ORDER BY avg(ontime.DepDelay)")
q2

# Which of the following companies has the highest number of cancelled flights, relative to their number of total flights?
q3<- dbGetQuery (conn, 
                 "SELECT q1.carrier AS carrier, (CAST(q1.numerator AS FLOAT)/ CAST(q2.denominator AS FLOAT)) AS ratio
                  FROM
                  (SELECT carriers.Description AS carrier, COUNT(*) AS numerator
                  FROM carriers JOIN ontime ON ontime.UniqueCarrier = carriers.Code
                  WHERE ontime.Cancelled = 1 AND carriers.Description IN ('United Air Lines Inc.', 'American Airlines Inc.', 'Pinnacle Airlines Inc.', 'Delta Air Lines Inc.')
                  GROUP BY carriers.Description
                  ) AS q1 JOIN
                  (SELECT carriers.Description AS carrier, COUNT(*) AS denominator
                  FROM carriers JOIN ontime ON ontime.UniqueCarrier = carriers.Code
                  WHERE carriers.Description IN ('United Air Lines Inc.', 'American Airlines Inc.', 'Pinnacle Airlines Inc.', 'Delta Air Lines Inc.')
                  GROUP BY carriers.Description
                  ) AS q2 USING(carrier)
                  ORDER BY ratio DESC")
q3

# Which of the following cities has the highest number of inbound flights (excluding cancelled flights)?

q4<- dbGetQuery (conn, 
                 "SELECT airports.city AS cities, count(*)
FROM airports JOIN ontime ON ontime.dest = airports.iata
WHERE ontime.Cancelled = 0
GROUP BY airports.city
ORDER BY count() DESC")
q4