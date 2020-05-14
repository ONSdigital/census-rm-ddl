create index IF NOT EXISTS event_uac_qid_link_id on event (uac_qid_link_id);
create index IF NOT EXISTS event_caze_case_id on event (caze_case_id);
create index IF NOT EXISTS uac_qid_caze_case_id on uac_qid_link (caze_case_id);