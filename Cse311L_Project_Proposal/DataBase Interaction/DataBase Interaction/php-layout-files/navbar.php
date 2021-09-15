<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Gym Logo</a>
    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
        <ul class="navbar-nav mx-auto py-2">
            <li class="nav-item ">
                <a class="nav-link text-white" href="index.php">Home</a>
            </li>
            <?php if (isset($_SESSION['user_id'])) {
            ?>
                <li class="nav-item">
                    <a class="nav-link text-white" href="packages.php">Packages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="instructors.php">Instructors</a>
                </li>
            <?php
            } ?>

            <li class="nav-item">
                <a class="nav-link text-white" href="gym-products.php">Buy Products</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link text-white" href="about-us.php">About Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="contact-us.php">Contact Us</a>
            </li>
            <?php if (isset($_SESSION['user_id'])) {
            ?>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white"  href="#" id="dropdownId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $_SESSION['name'] ?></a>
                    <div class="dropdown-menu" aria-labelledby="dropdownId">
                        <a class="dropdown-item" href="profile.php">Profile</a>
                        <a class="dropdown-item" href="membership.php">Membership Info</a>

                        <a class="dropdown-item" href="php-functions/logout.php">Log Out</a>

                    </div>
                </li>
            <?php
            } else {
            ?>
                <li class="nav-item">
                    <a class="btn btn-warning" href="sign-up.php">Sign Up</a>
                </li>
                <li class="nav-item ml-2">
                    <a class="btn btn-primary" href="login.php">Log In</a>
                </li>


            <?php
            } ?>
        </ul>
    </div>
</nav>