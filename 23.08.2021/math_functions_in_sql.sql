SELECT 
	IFNULL(comments, 'Kommentaar puudub') as parsed_comments,
    IF(status = 'Shipped', 'Välja saadetud', IF(status = 'Resolved', 'Korras', IF(status = 'Cancelled', 'Tühistatud', 'Ootel'))) as parsed_status
FROM
    orders;