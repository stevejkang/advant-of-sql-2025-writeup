SELECT DATE(measured_at) AS good_day FROM measurements where (DATE(measured_at) BETWEEN '2022-12-01' AND '2022-12-31') AND pm2_5 <= 9 ORDER BY measured_at ASC;
