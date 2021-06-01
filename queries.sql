-- Queries used to investigate table

SELECT * FROM b_corps_impact;

--Find first company certified that is still certified
SELECT company_name,
date_first_certified,
AVG(overall_score) as "avg_overall_score"
FROM b_corps_impact
WHERE current_status ='Certified'
GROUP BY company_name, date_first_certified, overall_score
ORDER BY date_first_certified
LIMIT 1;

-- Select current certified members
SELECT COUNT(current_status),
current_status
FROM b_corps_impact
GROUP BY current_status
ORDER BY current_status ASC
;

-- Investigating which companies have been assessed most 
SELECT COUNT(company_name) as "times_certified",
company_name,
date_first_certified
FROM b_corps_impact
WHERE current_status = 'Certified'
GROUP BY company_name, date_first_certified
ORDER BY times_certified DESC
;

-- Select by amount of assessments completed per year/ Which year had most assessments
SELECT COUNT(assessment_year) as "yearly_total",
assessment_year
FROM b_corps_impact
GROUP BY assessment_year
ORDER BY yearly_total DESC
;

-- Select by amount certified companies per country
SELECT COUNT(country) as "country_count",
country
FROM b_corps_impact
WHERE current_status = 'Certified'
GROUP BY country
ORDER BY country_count DESC
;