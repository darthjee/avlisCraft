package avliscraftgrails

class World {
  String name

  static mapping = {
    table 'worlds'
    version false
    id column:'id_world'
    name column:'name'
  }

  static constraints = {
  }

  String toString(){ name }
}
