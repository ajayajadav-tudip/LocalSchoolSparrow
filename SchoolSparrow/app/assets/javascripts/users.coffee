# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
usersReady = ->
#Method for allowing only letters
  jQuery.validator.addMethod 'letters_only', ((value, element) ->
    @optional(element) or /^[a-z ,.'-]+$/i.test(value)
  ), 'Letters only'

  # This method will allow strict email format
  jQuery.validator.addMethod 'custom_email', ((value, element) ->
    return /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value)
  ), 'Invalid email'

  $('#new_user').validate
    rules:
      'user[email]':
        custom_email: true
      'user[password]':
        required: true
      'user[retypepassword]':
        equalTo: '#user_password'
    messages:
      'user[email]': 'Please Enter valid Email'
      'user[retypepassword]':
        equalTo: 'same'
    highlight: (element) ->
      $(element).closest('.form-group').removeClass('has-success').addClass 'has-error'
    unhighlight: (element) ->
      $(element).closest('.form-group').removeClass('has-error').addClass 'has-success'
    errorElement: 'span'
    errorClass: 'help-block'

$(document).ready(usersReady)