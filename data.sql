INSERT INTO customer (name, description, created, updated, enabled) VALUES
  ('Maurin Makkara Oy', 'Get the pile', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, TRUE),
  ('Matin Makkara Oy', 'Get the pile', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, TRUE);

INSERT INTO project (customer_id, employee_id, name, description, start_date, status, created,updated) VALUES
  (1, 1, 'Maurin ERP', 'Uskomaton erp järjestelmä kaikilla herkuilla', CURRENT_DATE, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (1, 1, 'Maurin nettisivut', NULL, CURRENT_DATE, 'INACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO timesheet (project_id, employee_id, name, description, allocation, created, updated, status) VALUES
  (1, 1, 'Tunnit maurin erppiin', NULL, 100, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'ACTIVE'),
  (1, 2, 'Tunnit maurin erppiin', 'Leading Expert', 100, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'ACTIVE');

INSERT INTO task (project_id, name, description, created, updated, billable, status) VALUES
  (1, 'Ohjelmistokehitys', 'konsultointitunnit', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, TRUE, 'ACTIVE'),
  (1, 'Työpajaristeily', 'painajainen merellä', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, TRUE, 'ACTIVE');

INSERT INTO time_category (name, description, created, updated) VALUES
  ('Konsultointi', 'Asiakkaalta laskutettava työ', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Sisäinen työ', 'three.consulting sisäisen projektin tekemistä, ei laskutettavaa', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Loma', 'Vuosilomakertymää kuluttavaa lomailua', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Sairasloma', 'Ei kuluta vuosilomakertymää', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO timesheet_entry(timesheet_id, task_id, time_category_id, quantity, date, description, created, updated) VALUES
  (1, 1, 1, 1, CURRENT_DATE, 'Uusi ihan feature', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (2, 2, 1, 1, CURRENT_DATE, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
