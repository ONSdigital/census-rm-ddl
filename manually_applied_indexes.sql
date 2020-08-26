-- Index for case/space insensitive postcode search
CREATE INDEX postcode_upper_no_space_idx ON casev2.cases (UPPER(REPLACE(postcode, ' ', '')));
