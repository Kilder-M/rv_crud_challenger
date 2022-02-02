const createTable = '''
  CREATE TABLE product(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    details VARCHAR(300) NOT NULL,
    url_photo TEXT
  )

 ''';

 const insert = '''
  INSERT INTO product(name,details,photo)
  VALUES('teste','decriçao teste',)

 ''';