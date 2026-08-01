SELECT missing_date::date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_date
         LEFT JOIN (SELECT * FROM person_visits pv
                    WHERE (pv.person_id = '1' OR pv.person_id = '2')
                      AND (pv.visit_date BETWEEN '2022-01-01' AND '2022-01-10')
) t1 ON (missing_date = t1.visit_date)
WHERE t1.visit_date IS NULL
ORDER BY missing_date ASC