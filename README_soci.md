# Social Media Campaign Performance Analysis

## Project Overview
This project analyzes 300,000 social media advertising campaign records to uncover which platforms, audiences, locations and campaign goals deliver the best performance. The analysis was completed using **Excel**, **MySQL** and **Tableau**.

---

## Tools Used
- **Excel** – Data exploration, pivot tables, calculated columns and conditional formatting
- **MySQL** – Advanced queries including CASE statements, subqueries and multi-metric aggregations
- **Tableau** – Interactive four chart dashboard with cross filtering

---

## Dataset
- **Source:** Kaggle – Social Media Advertising Dataset by Jason Klein
- **Size:** 300,000 rows
- **Fields:** Campaign ID, Target Audience, Campaign Goal, Duration, Channel Used, Conversion Rate, Acquisition Cost, ROI, Location, Language, Clicks, Impressions, Engagement Score, Customer Segment, Date, Company

---

## Key Business Insights

### 1. Platform Performance
- **Twitter** delivers the highest overall average ROI
- **Facebook** and **Instagram** perform closely behind at around 4.0 ROI
- **Pinterest dramatically underperforms** all other platforms with an average ROI of ~0.72
- Budget should be reallocated away from Pinterest towards Twitter, Facebook and Instagram

### 2. Audience Insights
- **Women 18-24** drive the highest total clicks — best for awareness and engagement campaigns
- **Men 25-34 on Twitter** deliver the highest ROI — best for conversion focused campaigns
- Platform choice matters more than audience targeting when optimizing for ROI

### 3. Location Performance
- **New York** has the highest average ROI across all locations
- The best performing combination in New York is **Facebook targeting Women 45-60**
- New York campaigns should receive priority budget allocation

### 4. Campaign Goal Performance
- All campaign goals perform similarly — no single goal dramatically outperforms others
- This suggests **platform and audience selection matter more than campaign goal** when optimizing performance

### 5. Clicks vs ROI — An Important Distinction
| Metric | Best Performer |
|---|---|
| Total Clicks | Women 18-24 |
| Highest ROI | Men 25-34 on Twitter |
| Best Location | New York |
| Best City Combination | Facebook + Women 45-60 in New York |

This distinction is critical — high engagement does not always mean high return on investment.

---

## SQL Queries Used

```sql
-- Average ROI by Platform
SELECT Channel_Used,
ROUND(AVG(ROI), 2) AS Avg_ROI,
COUNT(*) AS Total_Campaigns
FROM social_media_ads
GROUP BY Channel_Used
ORDER BY Avg_ROI DESC;

-- Conversion Rate by Campaign Goal with Performance Label
SELECT Campaign_Goal,
ROUND(AVG(Conversion_Rate), 4) AS Avg_Conversion,
CASE
    WHEN AVG(Conversion_Rate) >= 0.10 THEN 'High Performer'
    WHEN AVG(Conversion_Rate) >= 0.07 THEN 'Average Performer'
    ELSE 'Low Performer'
END AS Performance_Label
FROM social_media_ads
GROUP BY Campaign_Goal
ORDER BY Avg_Conversion DESC;

-- Cost Efficiency by Location
SELECT Location,
ROUND(AVG(Acquisition_Cost), 2) AS Avg_Cost,
ROUND(AVG(ROI), 2) AS Avg_ROI,
ROUND(AVG(Conversion_Rate), 4) AS Avg_Conversion,
COUNT(*) AS Total_Campaigns
FROM social_media_ads
GROUP BY Location
ORDER BY Avg_ROI DESC;

-- Top 10 Performing Combinations in New York
SELECT Channel_Used, Target_Audience, Location,
ROUND(AVG(ROI), 2) AS Avg_ROI,
ROUND(AVG(Conversion_Rate), 4) AS Avg_Conversion,
ROUND(AVG(Acquisition_Cost), 2) AS Avg_Cost,
COUNT(*) AS Total_Campaigns
FROM social_media_ads
WHERE Location = 'New York'
GROUP BY Channel_Used, Target_Audience, Location
ORDER BY Avg_ROI DESC
LIMIT 10;
```

---

## Dashboard
The interactive Tableau dashboard includes:
- Average ROI by Platform (bar chart)
- Total Clicks by Target Audience (horizontal bar chart)
- Average ROI by Location (bar chart)
- Conversion Rate by Campaign Goal (bar chart)
- Cross filtering — clicking any chart filters all others simultaneously

🔗 **[View Interactive Dashboard]** — https://public.tableau.com/views/SocialMediaCampaignPerformanceAnalysis/SocialMediaCampaignPerformanceAnalysis?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

---

## Recommendations
1. **Cut Pinterest budget** and reallocate to Twitter, Facebook and Instagram
2. **Use Women 18-24 for awareness campaigns** where clicks and engagement are the goal
3. **Use Men 25-34 on Twitter for conversion campaigns** where ROI is the goal
4. **Prioritize New York** for highest ROI — specifically Facebook targeting Women 45-60
5. **Don't over-invest in optimizing campaign goals** — platform and audience matter more

---

## New Skills Demonstrated
Compared to my previous project this analysis introduced:
- CASE statements in SQL for performance labelling
- Multi-metric aggregations in a single query
- Conditional formatting in Excel pivot tables
- Geographic visualization attempts in Tableau
- Cross filtering across multiple dashboard charts

---

## Author
**Leaooana Matsoha**
Aspiring Data Analyst | Excel | MySQL | Tableau

[LinkedIn Profile](www.linkedin.com/in/leaooana-matsoha)
[Tableau Public Profile](https://public.tableau.com/app/profile/leaooana.matsoha)

