
    <style>
        main{
            height: 100vh;
            background: #555 url("<?=ROOT?>/assets/images/bg_logo1.png") no-repeat fixed center;
            position: relative;
            color: #fff;
        }
        main::before{
            position: absolute;
            content: "";
            background-color: rgba(0, 0, 0, 0.4);
            top: 0;
            width: 100%;
            height: 100%;
            z-index: 1;
        }
        .page{
            position: relative;
            z-index: 2;
        }
    </style>
    <main class="d-flex justify-content-center align-items-center flex-column">
        <div class="page"  id="home">
            <h2 class="mb-4">Wellcome to dracer corp</h2>
            <div>
                <a class="btn btn-lg btn-primary d-block" data-bs-toggle="modal" data-bs-target="#sign-in-modal" data-bs-user="employee">Login as Employee</a>
                <a class="btn btn-lg btn-outline-primary d-block mt-3" data-bs-toggle="modal" data-bs-target="#sign-in-modal" data-bs-user="admin">Login as Admin</a>
            </div>
            <div class="reset-link position-fixed bottom-0 end-0">
                <a  id="initialize-page-btn" data-target="initialize-app" class="btn btn-link" target="_blank">Initialize App</a>
            </div>
        </div>

        <div class="d-none page" id="initialize-app">
            <div style="max-width: 560px;">
                <div class="alert alert-warning position-static" id="init-warining">Please note that initializing the databse would reset the server and all save changes and configuration would be lost</div>
                <div class="mb-3 form-group">
                    <input type="password" class="form-control form-control-lg" placeholder="input secret key ..." id="initialize-secret-key">
                    <div class="invalid-feedback">Error message here</div>
                </div>
                <button type="button" class="btn btn-lg btn-primary w-100" id="initialize-btn">Initilize app</button>
                <div class="server-message my-3">
                    
                </div>
                <div class="loader d-none">
                    <span class="spinner-grow spinner-grow-sm text-secondary" role="status"></span>
                    <span class="spinner-grow spinner-grow-sm text-secondary mx-3" role="status"></span>
                    <span class="spinner-grow spinner-grow-sm text-secondary" role="status"></span>
                </div>
            </div>
        </div>
    </main>


    <aside>
        <div class="modal fade" id="sign-in-modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content">
                    <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Login your account</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    <form class="border rounded-3 p-3 shadow" id="sign-in-form" method="POST">
                        <div class="server-message"></div>

                        <div class="form-group mb-3" id="email-form">
                            <label for="log-email">Email</label>
                            <input type="email" id="employee-email" class="form-control" name="email">
                            <div class="invalid-feedback">Error message here</div>
                        </div>

                        <div class="form-group mb-3" id="username-form">
                            <label for="username">username</label>
                            <input type="text" id="admin-username" class="form-control" name="username">
                            <div class="invalid-feedback">Error message here</div>
                        </div>

                        <div class="form-group mb-3">
                            <label for="log-password">Password</label>
                            <input type="password" id="log-password" class="form-control" name="password">
                            <div class="invalid-feedback">Error message here</div>
                        </div>


                        <div class="loader d-none">
                            <span class="spinner-grow spinner-grow-sm text-secondary" role="status"></span>
                            <span class="spinner-grow spinner-grow-sm text-secondary mx-3" role="status"></span>
                            <span class="spinner-grow spinner-grow-sm text-secondary" role="status"></span>
                        </div>

                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </aside>
    <script src="<?=ROOT?>/static/js/home.js"></script>
    <script src="<?=ROOT?>/static/js/auth.js"></script>