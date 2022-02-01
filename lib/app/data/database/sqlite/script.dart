const createTable = '''
  CREATE TABLE product(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    details VARCHAR(300) NOT NULL,
    photo VARCHAR(400) NOT NULL
  )

 ''';

 const insert = '''
  INSERT INTO product(name,details,photo)
  VALUES('teste','decriçao teste','url da foto')

 ''';