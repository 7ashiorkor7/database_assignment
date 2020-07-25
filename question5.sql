SELECT COUNT(atx_id)
FROM agent_transactions
WHERE EXTRACT(MONTH from when_created = "2018")
GROUP BY EXTRACT(MONTH from when_created);