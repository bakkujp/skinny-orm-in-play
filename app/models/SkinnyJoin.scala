package models

import scalikejdbc._
import skinny.orm._
import org.joda.time._

/**
 * Created by bakkujp on 11/24/15.
 */
object SkinnyJoin {

}

case class Email(id: Long, email: String)
object Email extends SkinnyCRUDMapper[Email] {
  override def defaultAlias = createAlias("e")
  override def extract(rs: WrappedResultSet, n: ResultName[Email]) = new Email(id = rs.get(n.id), email = rs.get(n.email))
}

case class Account(id: Long, name: String, emails: Seq[Email] = Nil)
object Account extends SkinnyCRUDMapper[Account] {
  override def defaultAlias = createAlias("a")
  override def extract(rs: WrappedResultSet, n: ResultName[Account]) = new Account(id = rs.get(n.id), name = rs.get(n.name))

  lazy val emailRef = hasManyThrough[Email](
    through = AccountEmail,
    many = Email,
    merge = (a, emails) => a.copy(emails = emails)).byDefault

  def findSample(): Seq[Account] = {
    joins(Account.emailRef).findAll();
  }
}

// def extract is not needed
case class AccountEmail(accountId: Long, emailId: Long)
object AccountEmail extends SkinnyJoinTable[AccountEmail] {
  override def defaultAlias = createAlias("ae")
}
