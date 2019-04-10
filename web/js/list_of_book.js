// get material onchange selectPlant()
function getAllBook() {
    $.ajax({
        url: ` http://127.0.0.1:5000/all-books`,
        method: 'GET',
        success: function (response) {
            console.log(response)
            for (var i = 0; i < response.length; i++) {
                var books = `
                    <tr>
                        <td><input type="checkbox" class="tes" value="${response[i].id}"></td>
                        <td>${response[i].book_title}</td>
                        <td>${response[i].published}</td>
                        <td>${response[i].author}</td>
                    </tr>
                    `
                $('#book_list').append(books)
            }
        },
        error: function () {},
        complete: function () {}
    })
}

// button Convert to PR
function convertToPR() {
    var plant = $('#selectPlant :selected').val()
    var materials = []
    var qtys = []
    var message = ""
    $.each($('.tes:checked'), function () {
        var no = $(this).val()
        materials.push(no)

        qty = $(`#material-${no}`).val()
        if (qty == "") {
            message = "Please fill Convert Qty field in the selected material"
        } else {
            qtys.push(qty)
        }
    })

    if (plant == "Select Plant") {
        alert('Please select plant')
    } else if (message == "") {
        // alert('success')
        window.location.href = `pr_create.html?plant=${plant}&materials=${materials}&qtys=${qtys}`
    } else {
        alert(message)
    }
}