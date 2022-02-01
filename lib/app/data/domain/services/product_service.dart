import 'package:rv_crud_challenger/app/data/database/sqlite/dao/product_dao_implement.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/data/domain/exceptions/domain_layer_exception.dart';

class ProductService{
  final _dao = ProductDAOImplement();
    save(Product product){
    validateNome(product.name);
    validateDescricao(product.details);
    _dao.save(product);

  }

  remove(int id){
    _dao.remove(id);
  }

  Future<List<Product>>find()async{
    return _dao.find();
  }
  validateNome(String? name){
   var max = 50;
   var min =3;

   if(name == null){
     throw  DomainLayerException("O nome é obrigatório.");

   }else if(name.length > max){
     throw  DomainLayerException("O nome deve possuir no máximo $max caracters.");

   }else if(name.length < min){
     throw  DomainLayerException("O nome deve possuir no mínimo $min caracters.");
   }
    
 }

 validateDescricao(String? decricao){
   var max = 300;
   var min =5;

   if(decricao == null){
     throw  DomainLayerException("O email é obrigatório.");
   }else if(decricao.length > max){
     throw  DomainLayerException('A decrição deve possuiur no máximo $max caracters');
   }else if(decricao.length < min){
     throw  DomainLayerException('A decrição deve possuiur no mínimo $min caracters');
   }
 }


}