# Netflix SQL Data Analysis Project

## Overview
This project analyzes Netflix’s content catalog using **SQL** to solve 15 real-world business problems.  
The queries explore key aspects such as content type, genre trends, ratings, directors, and actor appearances.  
Each problem reflects a realistic analytical scenario for understanding Netflix’s data-driven decisions.

---

## Dataset Description
The dataset represents Netflix titles available globally and includes the following fields:

| Column Name | Description |
|--------------|--------------|
| **show_id** | Unique ID for each title |
| **type** | Movie or TV Show |
| **title** | Name of the show/movie |
| **director** | Director of the content |
| **cast** | List of actors/actresses |
| **country** | Country of production |
| **date_added** | Date when added to Netflix |
| **release_year** | Year of original release |
| **rating** | Content rating |
| **duration** | Duration (minutes or seasons) |
| **listed_in** | Genre or category |
| **description** | Short summary of the content |

---

## Objectives
To answer **15 business-driven questions** about Netflix’s content using SQL — revealing insights about:
- Content type distribution  
- Regional dominance  
- Director and actor activity  
- Genre performance  
- Time-based release patterns  

---

## Business Problems & SQL Solutions

### Basic / Descriptive Analysis
1. **Count the number of Movies vs TV Shows**  
2. **Find the most common rating** for movies and TV shows  
3. **List all movies released in a specific year** (e.g., 2020)  
4. **Find the top 5 countries** with the most content on Netflix  
5. **Identify the longest movie**  
6. **Find content added in the last 5 years**  
7. **Find all the movies/TV shows** directed by *Rajiv Chilaka*  
8. **List all TV shows** with more than **5 seasons**

---

### Analytical / Aggregation-Based Problems
9. **Count the number of content items** in each genre  
10. **Find each year and the average number of content releases in India**,  
    returning the **top 5 years** with the highest averages  
11. **List all movies** that are **Documentaries**  
12. **Find all content** without a **director**  
13. **Find how many movies actor 'Salman Khan'** appeared in during the **last 10 years**  
14. **Find the top 10 actors** who have appeared in the **highest number of movies produced in India**  

---

### Text & Conditional Analysis
15. **Categorize the content** based on keywords `'kill'` and `'violence'` in the description field.  
   - Label as `'Bad'` if such keywords are found  
   - Label as `'Good'` otherwise  
   - **Count** how many items fall into each category

---

## Tools & Technologies
- **SQL** (MySQL)  
- **Database Client:** MySQL Workbench
- **Dataset Source:** Netflix Titles (public Kaggle dataset)  

---

## Key Insights (Example)
- **Movies** form around 70% of total content.  
- **India, USA, UK, and Japan** dominate Netflix’s regional content library.  
- **TV Shows** with more than 5 seasons are relatively rare.  
- **Documentaries** have grown steadily in the last few years.  
- Text analysis of descriptions reveals around **8–10% of content** tagged as “Bad” based on violent keywords.

---

## 🚀 How to Run
1. Import the Netflix dataset into your SQL environment.  
2. Run the SQL scripts sequentially:
   - `netflix.sql`
3. Review and interpret the query outputs.  

---

##  Author
**Meherun Nesa**  
*SQL Data Analytics Project – Netflix Edition*  
*Exploring streaming content patterns through real-world business queries.*

---

##  Project Highlights
* 15 Real-World Business Scenarios
* Covers aggregation, joins, filtering, and text pattern analysis
*  Structured problem-solution approach
*   reat for SQL portfolio demonstration  

---
