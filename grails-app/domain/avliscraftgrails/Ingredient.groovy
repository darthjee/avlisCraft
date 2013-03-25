package avliscraftgrails


class Ingredient {
  Long id
  Item item
  Integer quantity
  Recipe recipe

  static belongsTo = [recipe:Recipe,item:Item]

  static mapping = {
    table 'ingredients'
    version false
    id column:'id_ingredient'
    item column:'id_item'
    recipe column:'id_recipe'
    quantity column:'qnt'
  }

  static constraints = {
  }

  String toString(){ quantity+" "+item }
}
