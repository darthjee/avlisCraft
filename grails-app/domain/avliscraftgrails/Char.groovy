package avliscraftgrails

class Char {
  Integer id
  String name
  World world
  
  static belongsTo = [user:User]

  static mapping = {
    table 'chars'
    version false
    id column:'id_char'
    user column:'id_user'
    world column:'id_world'
  }

  static constraints = {
  }

  String toString(){ name }
}
