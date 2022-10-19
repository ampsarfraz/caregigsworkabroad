class ConstantMutationQuaries {
  // INSERT_ONE
  insertOne(entity) {
    return '''mutation insert_${entity}one(\$object: ${entity}_insert_input!) { object: insert${entity}_one(object: \$object) { id } } ''';
  }

  //INSERT_MANY
  insertMany(entity) {
    return '''mutation insert_$entity(\$objects: [${entity}insert_input!]!) { objects: insert$entity(objects: \$objects) { affected_rows } } ''';
  }

  //UPSERT_ONE
  upsertOne(entity, key, columns) {
    return '''mutation insert_${entity}one(\$object: ${entity}_insert_input!) { object: insert${entity}_one(object: \$object, on_conflict: {constraint: $key, update_columns: [$columns]}) { id } } ''';
  }

  //UPSERT_MANY
  upsertMany(entity, key, columns) {
    return '''mutation insert_$entity(\$objects: [${entity}insert_input!]!) { objects: insert$entity(objects: \$objects, on_conflict: {constraint: $key, update_columns: [$columns]}) { affected_rows } }  ''';
  }

  //UPDATE_ONE
  updateOne(entity) {
    return '''mutation update_${entity}by_pk(\$id: uuid!, \$object: ${entity}_set_input) { object: update${entity}_by_pk(pk_columns: {id : \$id}, _set: \$object) { id } } ''';
  }

  // UPDATE_ONE_STR_ID
  updateOneStrId(entity) {
    return '''mutation update_${entity}by_pk(\$id: String!, \$object: ${entity}_set_input) { object: update${entity}_by_pk(pk_columns: {id : \$id}, _set: \$object) { id } } ''';
  }

  // UPDATE_MANY
  updateMany(entity) {
    return '''mutation update_$entity(\$where: ${entity}bool_exp!, \$object: ${entity}_set_input) { objects: update$entity(where: \$where, _set: \$object) { affected_rows } } ''';
  }

  //DELETE_ONE
  deleteOne(entity) {
    return '''mutation delete_${entity}by_pk(\$id: uuid!) { object: delete${entity}_by_pk(id : \$id) { id } } ''';
  }

  // DELETE_MANY
  deleteMany(entity) {
    return '''mutation delete_$entity(\$where: ${entity}bool_exp!) { object: delete$entity(where : \$where) { affected_rows } } ''';
  }
}
