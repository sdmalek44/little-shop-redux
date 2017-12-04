### General 
* [ ] Navigation to all links
* [ ] Simple styling present

### Iteration 1

* [ ] See all stations 
* [ ] See one station 
* [ ] Create a new station 
* [ ] Update a station 
* [ ] Delete a station (from either index or show)
* [ ] Cannot save without name, dock count, city, installation date

### Iteration 2

* [ ] 70 Stations Load from CSV

### Iteration 3

On `/station-dashboard`:

* [ ] Total count of stations
* [ ] Average bikes available per station (based on docks).
* [ ] Most bikes available at a station (based on docks).
* [ ] Station(s) where the most bikes are available (based on docks).
* [ ] Fewest bikes available at a station (based on docks).
* [ ] Station(s) where the fewest bikes are available (based on docks).
* [ ] Most recently installed station.
* [ ] Oldest station.

### Iteration 4

* [ ] See all trips 
* [ ] See one trip
* [ ] Create a new trip 
* [ ] Update a trip 
* [ ] Delete a trip (from either index or show)
* [ ] All attributes (except zip code) must be present: duration, start date, start station, end date, end station, bike ID, subscription type)
* [ ] Trips are paginated in groups of 30 

### Iteration 5

* [ ] Trips load from CSV

### Iteration 6

On `/trips-dashboard`:

* [ ] Average duration of a ride.
* [ ] Longest ride.
* [ ] Shortest ride.
* [ ] Station with the most rides as a starting place.
* [ ] Station with the most rides as an ending place.
* [ ] Month by Month breakdown of number of rides with subtotals for each year.
* [ ] Most ridden bike with total number of rides for that bike.
* [ ] Least ridden bike with total number of rides for that bike.
* [ ] User subscription type breakout with both count and percentage.
* [ ] Single date with the highest number of trips with a count of those trips.
* [ ] Single date with the lowest number of trips with a count of those trips.

On an individual station show page the additional information should be present:

* [ ] Number of rides started at this station.
* [ ] Number of rides ended at this station.
* [ ] Most frequent destination station (for rides that began at this station).
* [ ] Most frequent origination station (for rides that ended at this station).
* [ ] Date with the highest number of trips started at this station.
* [ ] Most frequent zip code for users starting trips at this station.
* [ ] Bike ID most frequently starting a trip at this station.

### Iteration 7

* [ ] See all conditions
* [ ] See one condition
* [ ] Create a new condition
* [ ] Update a condition
* [ ] Delete a station (from both index or show)
* [ ] Attributes include: date, max_temperature, mean_temperature, min_temperature, mean_humidity, mean_visibility (in Miles), mean_wind_speed (mph), precipitation (inches)
* [ ] Conditions are paginated by groups of 30

### Iteration 8

* [ ] Weathers load from CSV

### Iteration 9

On `/weather-dashboard`:

* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
* [ ] Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.

Additional information on the `trip-dashboard`:

* [ ] Weather on the day with the highest rides.
* [ ] Weather on the day with the lowest rides.
