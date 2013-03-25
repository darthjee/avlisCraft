package avliscraftgrails

class Item {
  Integer id
  String name


  static mapping = {
    table 'items'
    version false
    id column:'id_item'
  }

  static constraints = {
  }

  String toString(){ name }
}
