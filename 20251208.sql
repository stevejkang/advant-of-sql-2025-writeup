SELECT *
FROM wines
WHERE color = 'white'
  AND quality >= 7
  AND density > (SELECT AVG(density) FROM wines)
  AND residual_sugar > (SELECT AVG(residual_sugar) FROM wines)
  AND pH < (SELECT AVG(pH) FROM wines WHERE color = 'white')
  AND citric_acid > (SELECT AVG(citric_acid) FROM wines WHERE color = 'white');
