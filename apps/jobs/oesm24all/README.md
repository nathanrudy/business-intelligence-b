---
sdk: docker
app_port: 7860
title: ISA 401 Airbnb Dataset Explorer
emoji: 🏠
colorFrom: yellow
colorTo: yellow
pinned: false
license: mit
short_description: Explore U.S. occupational employment and wage data
---

# ISA 401 Airbnb Dataset Explorer

**Your AI-Powered Assistant for Exploring Columbus Area Airbnbs**

[![Live App](https://img.shields.io/badge/Live_App-Hugging_Face-yellow)] (https://huggingface.co/spaces/nathanrudy/airbnb-columbus-explorer)

Explore the Columbus Area Airbnb market dataset using natural language queries.

---

## What is this app?

This Shiny application uses AI-powered natural language processing to help you explore the COlumbus Airbnb dataset. Instead of writing SQL queries, simply ask questions in plain English and get instant results.

**Example queries:**
- "Show me the top 10 most cheapest private rooms"
- "Calculate the total number of hotel rooms per neighbourhood"
- "What hosts have over 10 properties that they manage?"

---

## Dataset Information

**Dataset:** Columbus, Ohio Airbnb Listing Statistics (Updated September 26, 2025)
**Publisher:** Inside Airbnb
**Website:** https://insideairbnb.com/

The OEWS program produces employment and wage estimates annually for over 800 occupations. These estimates are available for the nation as a whole, for individual states, and for metropolitan and nonmetropolitan areas.

### Key Fields

| Field | Description |
|-------|-------------|
| `name` | Listing title used on Airbnb. |
| `host_name` | Host's first name. |
| `neighbourhood` | The name of the neighbourhood within Columbus that the listing is found in. |
| `room_type` | Type of accommodation provided by the listing. Displays what type of space you are renting. |
| `price` | The nightly cost of the listing in USD. |
| `minimum_nights` | The minimum nights required to book the listing. |
| `number_of_reviews` | Total number of reviews made by guests for a particular listing.  |
| `last_review` | The date of the most recent review provided for a listing. |
| `reviews_per_month` | Average number of reviews provided per month. |
| `availability_365` | The days available for booking within the next year. If a listing is fully booked or delisted, this value will be 0. |
| `license` | The license or registration number of a property. This may be blank if a listing is either exempt or unlicensed. |

---

## Features

- **Natural Language Queries**: Ask questions in plain English
- **SQL Transparency**: See the generated SQL for each query
- **Interactive Data Table**: Sort, filter, and export results
- **Miami University Theming**: Branded for ISA 401 course use

---

## Running Locally

**With R:**
```r
# Install dependencies
renv::restore()

# Run the app
shiny::runApp('.', host = '0.0.0.0', port = 7860)
```

**With Docker:**
```bash
# Build the image
docker build -t oews-explorer .

# Run with OpenAI API key
docker run --rm -p 7860:7860 -e OPENAI_API_KEY=$OPENAI_API_KEY oews-explorer
```

---

## Required Environment Variable

This app requires an OpenAI API key to function:

```bash
export OPENAI_API_KEY="your-api-key-here"
```

On Hugging Face Spaces, set this as a secret in your Space settings.

---

## Technology Stack

- **[Shiny](https://shiny.posit.co/)** - Web application framework for R
- **[querychat](https://github.com/posit-dev/querychat)** - Natural language data querying
- **[bslib](https://rstudio.github.io/bslib/)** - Bootstrap theming for Shiny
- **[DT](https://rstudio.github.io/DT/)** - Interactive data tables

---

## Course Information

This application was developed for **ISA 401** at **Miami University** to help students explore and understand labor market data using modern AI-powered tools.

---

## Data Source

Bureau of Labor Statistics, U.S. Department of Labor. *Occupational Employment and Wage Statistics (OEWS), May 2024 Estimates.*
https://www.bls.gov/oes/
