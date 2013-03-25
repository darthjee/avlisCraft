package avliscraftgrails

class User {
  Integer id
  String login

  static mapping = {
    table 'pure_users'
    version false
    id column:'id_user'
    login column:'login'
  }

  static hasMany = [chars:Char,recipes:Recipe]

  static constraints = {
  }

  String toString(){ login }
}
