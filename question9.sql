SELECT COUNT(transfers.source_wallet_id) AS unique_senders, 
COUNT(transfer_id) AS transaction_count, 
transfers.kind AS transfer_kind, 
wallets.ledger_location AS country, 
SUM(transfers.send_amount_scalar) AS volume 
FROM transfers 
INNER JOIN wallets 
ON transfers.source_wallet_id = wallets.wallet_id 
WHERE (transfers.when_created > (NOW() - INTERVAL '1 week')) 
GROUP BY wallets.ledger_location, transfers.kind; 
