CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admiitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(100),
  FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(50),
  name VARCHAR(50)
);

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL(10,2),
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medica_history_id INT,
  FOREIGN KEY (medica_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL(10,2),
  quantity INT,
  total_price DECIMAL(10,2),
  invoice_id INT,
  treatement_id INT,
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatement_id) REFERENCES treatments(id)
);
--Create joined table for many to many relationship.

CREATE TABLE treatment_histories (
  medical_history_id INT,
  treatment_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
