SELECT city,volume,country INTO atx_volume_city_country_summary
FROM(SELECT agents.city AS city, agents.country AS country,
	COUNT(agent_transactions.atx_id) AS volume
	FROM agents 
	INNER JOIN agent_transactions
	ON agents.agent_id = agent_transactions.agent_id
	WHERE (agent_transactions.when_created > NOW()-INTERVAL '1 week') 
	GROUP BY agents.country, agents.city) AS atx_volume_country_summary;