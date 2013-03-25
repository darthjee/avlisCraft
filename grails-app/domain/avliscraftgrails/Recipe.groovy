package avliscraftgrails

class Recipe {
  Integer id
  Item item
  World world
  Skill skill
  Short level
  Integer quantity
  Boolean confirmed


  static belongsTo=[user:User, skill:Skill]
  static hasMany=[ingredients:Ingredient]
  
  static mapping = {
    table 'recipes'
    version false
    world column:'id_world'
    user column:'id_user'
    item column:'id_item'
    skill column:'id_skill'
    level column:'level'
    quantity column:'qtn'
    confirmed column:'confirmed'
    id column:'id_recipe'
  }

  static constraints = {
  }

  String toString(){ item }
}
