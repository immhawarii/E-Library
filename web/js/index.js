function signin() {
    //jquery
    var email_ = $('input#email').val()
    var password_ = $('input#password').val()

    $.ajax({
        url: `${host}/login-member`,
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            email: email_,
            password: password_
        }),
        success: function (response) {
            console.log(response)
            setCookie('name', response.name, 7)
            setCookie('id', response.id, 7)
            window.location.href = 'dashboard_e.html'
        },
        error: function () {
            // alert(error)
            alert('username or password is wrong')
        },
        complete: function () {
            // alert('data sudah selesai')
        }
    })
}