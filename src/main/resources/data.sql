INSERT IGNORE INTO categories (name) VALUE ('Ubrania');
INSERT IGNORE INTO categories (name) VALUE ('Zabawki');
INSERT IGNORE INTO categories (name) VALUE ('Książki');
INSERT IGNORE INTO categories (name) VALUE ('Gry');
INSERT IGNORE INTO categories (name) VALUE ('Inne');

INSERT IGNORE INTO institutions (description, name) VALUES ('Pomagamy bo możemy', 'Fundacja "Auxilium"');
INSERT IGNORE INTO institutions (description, name) VALUES ('Pomagamy bo chcemy', 'Fundacja "Podaj rękę"');
INSERT IGNORE INTO institutions (description, name) VALUES ('Pomagamy jak umiemy', 'Fundacja "Pomóż"');

INSERT IGNORE INTO roles (name) VALUE ('ROLE_ADMIN');
INSERT IGNORE INTO roles (name) VALUE ('ROLE_USER');

INSERT IGNORE INTO users (email, enabled, name, password, surname) VALUES ('ola@ola.pl', 1, 'Ola', '$2a$10$wcEpXdT/XTxCQBTZT2zl..q9Tmmn4KjIQjx85yFeb54zUC0PiFD.O', 'Ola' );

INSERT IGNORE INTO user_role (user_id, role_id) VALUES (1, 2);

INSERT IGNORE INTO donations (city, phone_number, pick_up_comment, pick_up_date, pick_up_time, quantity, street, zip_code, institution_id)
VALUES ('Lublin', '999888777', '4te piętro bez windy', '2022-12-12', '15:40', 2, 'Paganiniego 15/15', '30-360', 1);

INSERT IGNORE INTO donations_categories(donation_id, categories_id) VALUES (1, 1);
INSERT IGNORE INTO donations_categories(donation_id, categories_id) VALUES (1, 2);

INSERT IGNORE INTO users_donations(user_id, donation_id)  VALUES (1, 1);