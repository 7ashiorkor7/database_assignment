SELECT source_wallet_id, send_amount_scalar 
FROM transfers 
WHERE send_amount_currency = 'CFA' 
AND (send_amount_scalar>10000000)
AND (transfers.when_created > (NOW() - INTERVAL '1 month')); 

	  