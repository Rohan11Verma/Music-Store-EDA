# 1. Who is the senior most employee based on job title? 
SELECT 
    *
FROM
    employee
ORDER BY levels DESC
LIMIT 1;

# 2. Which countries have the most Invoices? 
SELECT 
    COUNT(invoice_id) AS number_of_invoices,
    billing_country AS country
FROM
    invoice
GROUP BY country
ORDER BY number_of_invoices DESC
LIMIT 1;

# 3. What are top 3 values of total invoice?
SELECT 
    invoice_id, total
FROM
    invoice
ORDER BY total DESC
LIMIT 3;

# 4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals 
SELECT 
    billing_city AS city, SUM(total) AS total_revenue
FROM
    invoice
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 1;

# 5. Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money 
SELECT 
    c.first_name,
    c.last_name,
    c.customer_id,
    SUM(i.total) AS total
FROM
    customer c
        JOIN
    invoice i ON c.customer_id = i.customer_id
GROUP BY c.first_name , c.last_name , c.customer_id
ORDER BY total DESC
LIMIT 1;

# 6. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A
SELECT DISTINCT
    c.email, c.first_name, c.last_name, g.name
FROM
    customer c
        JOIN
    invoice i ON c.customer_id = i.customer_id
        JOIN
    invoice_line il ON i.invoice_id = il.invoice_id
        JOIN
    track t ON il.track_id = t.track_id
        JOIN
    genre g ON t.genre_id = g.genre_id
WHERE
    g.name = 'Rock' AND c.email LIKE 'a%'
ORDER BY c.email;

 
# 7. Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands 
SELECT 
    a.artist_id,
    a.name,
    COUNT(t.track_id) AS number_of_rock_songs
FROM
    artist a
        JOIN
    album al ON a.artist_id = al.artist_id
        JOIN
    track t ON al.album_id = t.album_id
WHERE
    t.genre_id = (SELECT 
            genre_id
        FROM
            genre g
        WHERE
            g.name = 'Rock')
GROUP BY a.name , a.artist_id
ORDER BY number_of_rock_songs DESC
LIMIT 10;

# 8. Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first 
SELECT 
    name, milliseconds
FROM
    track
WHERE
    milliseconds > (SELECT 
            AVG(milliseconds)
        FROM
            track)
ORDER BY milliseconds DESC;

# 9. We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared return all Genres.
WITH popular_genre AS 
(
    SELECT COUNT(invoice_line.quantity) AS purchases, customer.country, genre.name, genre.genre_id, 
	ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo 
    FROM invoice_line 
	JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
	JOIN customer ON customer.customer_id = invoice.customer_id
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN genre ON genre.genre_id = track.genre_id
	GROUP BY 2,3,4
	ORDER BY 2 ASC, 1 DESC
)
SELECT * FROM popular_genre WHERE RowNo <= 1;


# 10. Write a query that determines the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.
WITH Customter_with_country AS (
		SELECT customer.customer_id,first_name,last_name,billing_country,SUM(total) AS total_spending,
	    ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY SUM(total) DESC) AS RowNo 
		FROM invoice
		JOIN customer ON customer.customer_id = invoice.customer_id
		GROUP BY 1,2,3,4
		ORDER BY 4 ASC,5 DESC)
SELECT * FROM Customter_with_country WHERE RowNo <= 1
