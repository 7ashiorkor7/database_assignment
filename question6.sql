SELECT city,volume INTO atx_volume_city_summary 
FROM(SELECT agents.city AS city, 
	 COUNT(agent_transactions.atx_id) AS volume 
	 FROM agents 
	 INNER JOIN agent_transactions 
	 ON agents.agent_id = agent_transactions.agent_id 
	 WHERE (agent_transactions.when_created > (NOW()-INTERVAL '1 week')) 
	 GROUP BY  agents.city) AS atx_volume_summary;