UPDATE casev2.event
SET event_payload = jsonb_set(event_payload, '{uac,uac}', '"REDACTED"'::jsonb, true)
WHERE event_type = 'UAC_UPDATED';

UPDATE casev2.event
SET event_payload = jsonb_set(event_payload, '{uacQidCreated,uac}', '"REDACTED"'::jsonb, true)
WHERE event_type = 'RM_UAC_CREATED';
