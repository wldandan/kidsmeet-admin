$(function() {
  var userAgent = navigator.userAgent.toLowerCase();
  var isOpera = userAgent.indexOf("opera") > -1;
  var isChrome = userAgent.indexOf("chrome") > -1;
  if ( !isOpera && !isChrome ) {
    $("#new_attendance").validate({
      rules: {
        'attendance[username]': {
          required: true
        },
        'attendance[phone_number]': {
          required: true,
          maxlength: 11,
          minlength: 11
        },
        'attendance[email]': {
          required: true,
          email: true
        }
      },
      messages: {
        'attendance[username]': "请输入您的真实姓名",
        'attendance[phone_number]': "请输入合法的11位手机号(例如: 13512341234)",
        'attendance[email]': {
          required: "请输入Email地址",
          email: "请输入合法的电子邮件地址(例如: example@example.com)"
        }
      },
      errorPlacement: function(error, element) {
        element.prev().css('color', '#ff6800');
        element.css('border', '1px solid #ff6800');
      }
    })
  };
});