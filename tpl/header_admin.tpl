<div class="col-12">
    <div class="d-flex justify-content-between">
        <div class="title">
            <h1 class="display-5">Библиотека Ш++</h1>
        </div>
        <div class="btn">
            <button type="button" class="btnLogOut btn btn-link">Выход</button>
        </div>
    </div>
</div>
<hr style="border: 2px solid green; margin: 0">
<script>
    $('.btnLogOut').click(function(event) {
        $.ajax({
            type: "GET",
            url: "/admin",
            async: false,
            username: "logout",
            password: "logout",
            headers: { "Authorization": "Basic admin-panel" }
        })
            .done(function(){
                // If we don't get an error, we actually got an error as we expect an 401!
            })
            .fail(function(){
                // We expect to get an 401 Unauthorized error! In this case we are successfully
                // logged out and we redirect to the user main page.
                window.location = "/";
            });
    });
</script>