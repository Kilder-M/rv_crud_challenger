const createTable = '''
  CREATE TABLE image(
    id INTEGER NOT NULL PRIMARY KEY,
    image_name BLOB NOT NULL,
    product_id INTEGER NOT NULL,
    FOREIGN KEY(product_id) REFERENCES product(id)


    
  
  )

 ''';

//  const insert = '''
//   INSERT INTO product(name,image_name)
//   VALUES('teste','decriçao teste','url da foto')

//  ''';