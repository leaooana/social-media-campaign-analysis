select count(*) from social_media_ads;

-- avarage ROI by platform
SELECT Channel_Used,
ROUND(AVG(ROI), 2) AS Avg_ROI,
COUNT(*) AS Total_Campaigns
FROM social_media_ads
GROUP BY Channel_Used
ORDER BY Avg_ROI DESC;

-- conversion rate by campaign goal
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

-- cost efficiency by location
SELECT Location,
ROUND(AVG(Acquisition_Cost), 2) AS Avg_Cost,
ROUND(AVG(ROI), 2) AS Avg_ROI,
ROUND(AVG(Conversion_Rate), 4) AS Avg_Conversion,
COUNT(*) AS Total_Campaigns
FROM social_media_ads
GROUP BY Location
ORDER BY Avg_ROI DESC;

-- Best Platform per Target Audience
SELECT Target_Audience, Channel_Used,
ROUND(AVG(ROI), 2) AS Avg_ROI
FROM social_media_ads
GROUP BY Target_Audience, Channel_Used
ORDER BY Target_Audience, Avg_ROI DESC;

--  10 best performing combinations specifically in New York
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