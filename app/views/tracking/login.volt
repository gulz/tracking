{{ content() }}
<div class="login-bg animatedParent" style="margin-top: 120px;">

    <?php echo $this->tag->form("tracking/login"); ?>
        <h2>Login</h2>
        <div class="form-group">
            <label for="login">Login</label>
            <?php echo $this->tag->textField("login"); ?>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <?php echo $this->tag->passwordField("password"); ?>
        </div>
        <div class="form-group">
            <a href="#">Forgot Password?</a>
            <button>Login</button>
        </div>
    </form>

    <h3 class="text-center create">Dont have account? <a href="sign-up.html">Create Account</a></h3>
</div>