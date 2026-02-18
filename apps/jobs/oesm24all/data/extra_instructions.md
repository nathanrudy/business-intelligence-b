# Extra Instructions

## Room_type (exact)
- Use `room_type = 'Entire home/apt'` for renting the entire home or apartment.
- For having a private room, use `room_type = 'Private'`.
- Use `room_type = 'Shared room'` for renting one bed in a room shared by other people.
- Use `room_type = 'Hotel room'` for renting a room in a commercial hotel.
- Always specify which room_type is being used

## Neighbourhood (exact, if needed)
- Use `neighbourhood = 'XXXXX'` to filter exact neighbourhood
- Text matches are **case-sensitive**.
- If you want all neighbourhoods, this can be left blank

## Price queries (optional)
- Use `price = 'XXX'` as a whole number to filter by nightly rates as integers.

## Reviews_per_month (special symbols)
Specify how to handle 0. Example option:
- Treat values of 0 as NULL

## availability_365 (special symbols)
Specify how to handle 0.
- If `availability_365 = '0'`, then the listing is either fully booked for the year, or has since been delisted.

## calculated_host_listings_count (Host analysis)
- Use `calculated_host_listings_count = 'X'` to sort by hosts who manage 'X' number of listings. 

## Rounding and deduplication
- If you want to avoid double-counting across listing or name groupings, specify a dedupe approach (for example: “use unique listing  to avoid double-counting”).

## Verification step (recommended)
If any filter is ambiguous, request a preview first:
- “Show matching rows so I can confirm `room_type`, `neighbourhood`, and `price` before aggregating.”

## Action wording (so I take the right next step)
Start your request with:
- **Calculate** / **Compute** → run a query and return computed results
- **Show** / **Filter to** → update the dashboard view and return all columns

---

# Paste-ready prompt templates

- **Calculate average price per night of Entire House listings that can be rented for 1 night**  
  `room_type = 'Entire home/apt', minimum_nights = 1,  calculate: AVG(price)`

- **Show all listings with licenses and hosts who manage multiple listings**  
  `Show: license = 'NOT NULL' AND calculated_host_listings_count > 1`

- **Compare average pricing for all room types**  
  `Compute: AVG(price) for room_type. Group by room_type`

---

# Default behavior
If you include the relevant filters, I will apply these rules automatically. If a request is ambiguous, I will first show the matching rows and ask you to confirm the labels before aggregating.
