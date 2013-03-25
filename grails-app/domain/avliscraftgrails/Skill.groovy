package avliscraftgrails

class Skill {
  Integer id
  String name

  static hasMany = [recipes:Recipe]
  
  static mapping = {
    table 'skill'
    version false
    name column:'name'
    id column:'id_skill'
  }

  static constraints = {
  }

  String toString(){name}
}
