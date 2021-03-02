$(document).ready(function() {
    let creatTable = undefined
    let result = undefined
    creatTable = () => {
        $.get('/company/all', function(data, status) {

            result = (data);

            let thead = Object.keys(result[0])

            $('.table').html('')
            $('.table').append(`<table class="table table-dark table-striped">
            <thead>
                <tr class="tableHeadRow">

                </tr>
            </thead>
            <tbody class="tbody">

            </tbody>
        </table>`)
            for (let i = 0; i < thead.length - 2; i++) {
                $(".tableHeadRow").append(`<th scope="col">${thead[i]}</th>
                `)
            }
            for (let i = 0; i < result.length; i++) {
                $(".tbody").append(` <tr class="tr">
                <td class="id">${result[i]._id}</td>
        <td>${result[i].name}</td>
        <td>${result[i].creatId}</td>
        <td>${result[i].number}</td>
        <td>${result[i].city}</td>
        <td>${result[i].province}</td>
        <td>${result[i].dateOfCreation}</td>
        </tr>
        `)
            }

            console.log(result);
        })
    }
    creatTable();
    let company = undefined
    $('body').on('click', '.tr', function() {
        let companyId = ($(this).find(".id").html());
        for (let i in result) {
            if (result[i]._id == companyId) {
                company = result[i]
            }
        }



        $('.editBody').html('')
        $(".E_D").click()
        $('.editBody').html(`
        <input type="text"  id="name" class=" form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${company.name}">
        <input type="number" id="createId" class=" form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${company.creatId}">
        <input type="number" id="number" class=" form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${company.number}">
        <input type="text" id="city" class=" form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${company.city}">
        <input type="text" id="province"  class=" form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${company.province}">
        <input type="text" id="date" form-control" class="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${company.dateOfCreation}">`)

        $('body').on('click', '.Esave', function() {
            let name = $('#name').val()
            let id = $('#createId').val()
            id = Number(id)
            let number = $('#number').val()
            number = Number(number)
            let city = $('#city').val()
            let province = $('#province').val()
            let date = $('#date').val()

            function person(name, id, city, province, number, date) {
                this.name = name;
                this.creatId = id;
                this.city = city;
                this.province = province;
                this.number = number;
                this.dateOfCreation = date;
            }
            let neWcompany = new person(name, id, city, province, number, date)

            $.post(`/company/${company._id}`, (neWcompany), function(result) {
                creatTable();
                $(".modal .Eclose").click()
            });

        })
        $('body').on('click', '.delete', function() {

            let txt;
            if (confirm("ARE YOU SURE YOU WANT TO DELETE THIS COMPANY?")) {
                txt = true;
            } else {
                txt = false;
            }
            if (txt === true) {
                $.ajax({
                    url: `/company/${company._id}`,
                    type: "DELETE",
                    success: (data) => {
                        creatTable();
                        $(".modal .Eclose").click()
                    },
                    error: function(err) {
                        alert(err.responseText);
                    }

                })

            } else {
                $(".modal .Eclose").click()
            }

        })
    })

    $('body').on('click', '.save', function() {
        let name = $('.name').val()
        let id = $('.createId').val()
        id = Number(id)
        let number = $('.number').val()
        number = Number(number)
        let city = $('.city').val()
        let province = $('.province').val()
        let date = $('.date').val()

        function person(name, id, city, province, number, date) {
            this.name = name;
            this.creatId = id;
            this.city = city;
            this.province = province;
            this.number = number;
            this.dateOfCreation = date;
        }
        let company = new person(name, id, city, province, number, date)

        $.ajax({
            url: '/company/',
            type: 'PUT',
            data: company,
            success: function(data) {
                $(function() {
                    creatTable();
                    $(".modal .close").click()
                });

            },
            error: function(err) {
                alert(err.responseText);
            }
        });
    })
});