require 'mail'

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless valid_email?(value)
      msg = options[:message] 
      msg ||= I18n.t(:"validators.email.invalid", :default => "has invalid format")
      record.errors[attribute] << msg
    end
  end

  protected

  # Internal: Takes an email and returns whether is invalid or not.
  #
  # email - A String email address to be validated.
  #
  # Returns true if email is valid.
  def valid_email?(email)
    mail = Mail::Address.new(email)

    # We must check that value contains a domain and that value is 
    # an email address
    result = mail.domain && mail.address == email
    tree = mail.__send__(:tree)

    # We need to dig into treetop. A valid domain must have 
    # dot_atom_text elements size > 1. Addresses like user@localhost 
    # are excluded. Treetop must respond to domain.
    result && (tree.domain.dot_atom_text.elements.size > 1)
  rescue => e
    false
  end
end
