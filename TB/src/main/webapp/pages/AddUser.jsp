<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="JavaScript/LoginValidation.js"></script>
<script src="JavaScript/LoginAjaxCalls.js"></script>
<style>
	use postcss-preset-env {
	stage: 0;
}

/* config.css */
:root {
	--baseColor: #606468;
}

/* helpers/align.css */
.align {
	display: grid;
	place-items: center;
}

.grid {
	inline-size: 90%;
	margin-inline: auto;
	max-inline-size: 25rem;
}

/* helpers/hidden.css */
.hidden {
	border: 0;
	clip: rect(0, 0, 0, 0);
	height: 1px;
	margin: -1px;
	overflow: hidden;
	padding: 0;
	position: absolute;
	width: 1px;
}

/* helpers/icon.css */
:root {
	--iconFill: var(--baseColor);
}

.icons {
	display: none;
}

.icon {
	block-size: 1em;
	display: inline-block;
	fill: var(--iconFill);
	inline-size: 1em;
	vertical-align: middle;
}

/* layout/base.css */
:root {
	--htmlFontSize: 100%;
	--bodyBackgroundColor: #2c3338;
	--bodyColor: var(--baseColor);
	--bodyFontFamily: "Open Sans";
	--bodyFontFamilyFallback: sans-serif;
	--bodyFontSize: 0.875rem;
	--bodyFontWeight: 400;
	--bodyLineHeight: 1.5;
}

* {
	box-sizing: inherit;
}

html {
	box-sizing: border-box;
	font-size: var(--htmlFontSize);
}

body {
	background-color: black; /* var(--bodyBackgroundColor); */
	color: var(--bodyColor);
	font-family: var(--bodyFontFamily), var(--bodyFontFamilyFallback);
	font-size: var(--bodyFontSize);
	font-weight: var(--bodyFontWeight);
	line-height: var(--bodyLineHeight);
	margin: 0;
	min-block-size: 100vh;
}

/* modules/anchor.css */
:root {
	--anchorColor: #eee;
}

a {
	color: var(--anchorColor);
	outline: 0;
	text-decoration: none;
}

/* modules/form.css */
:root {
	--formGap: 0.875rem;
}

input {
	background-image: none;
	border: 0;
	color: inherit;
	font: inherit;
	margin: 0;
	outline: 0;
	padding: 0;
	transition: background-color 0.3s;
}

input[type="submit"] {
	cursor: pointer;
}

.form {
	display: grid;
	gap: var(--formGap);
}

.form input[type="password"], .form input[type="text"], .submit{
	inline-size: 100%;
}

.form__field {
	display: flex;
}

.form__input {
	flex: 1;
}

/* modules/login.css */
:root {
	--loginBorderRadus: 0.25rem;
	--loginColor: #eee;
	--loginInputBackgroundColor: #3b4148;
	--loginInputHoverBackgroundColor: #434a52;
	--loginLabelBackgroundColor: #363b41;
	--loginSubmitBackgroundColor: #ea4c88;
	--loginSubmitColor: #eee;
	--loginSubmitHoverBackgroundColor: #d44179;
}

.login {
	color: var(--loginColor);
}

.login label, .login input[type="text"], .login input[type="password"], .login input[type="mail"],
	.submit {
	border-radius: var(--loginBorderRadus);
	padding: 1rem;
}

.login label {
	background-color: var(--loginLabelBackgroundColor);
	border-bottom-right-radius: 0;
	border-top-right-radius: 0;
	padding-inline: 1.25rem;
}

.login input[type="password"], .login input[type="text"], .login input[type="mail"] {
	background-color: var(--loginInputBackgroundColor);
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
}

.login input[type="password"]:focus, .login input[type="password"]:hover,
	.login input[type="text"]:focus, .login input[type="text"]:hover,
	.login input[type="mail"]:focus, .login input[type="mail"]:hover, {
	background-color: var(--loginInputHoverBackgroundColor);
}

.submit {
	background-color: var(--loginSubmitBackgroundColor);
	color: var(--loginSubmitColor);
	font-weight: 700;
	text-transform: uppercase;
	text-align : center;
	text-decoration :none;
}

.submit:focus, .submit:hover {
	background-color: var(--loginSubmitHoverBackgroundColor);
}

/* modules/text.css */
p {
	margin-block: 0.5rem;
}

.text--center {
	text-align: center;
}
#warning{
	color : red;
}
.holder{
	text-align : center;
	color : yellow;
}
.indicatorRed{
	fill: red;
}
.indicatorGreen{
	fill: green;
}

.messagetext{
	color : #76735a;
}
</style>
</head>
<body class="align">
	<div class="grid">
	<h1 class="holder">Get Your Show</h1>
	<span id="warning"></span>
		<form action="" method="POST" class="form login" name="form">
			<div class="form__field">
				<label for="login__username">
					<svg class="icon indicatorRed" ><use xlink:href="#icon-phone"></use></svg>
					<span class="hidden">Phone</span>
				</label>
					<input autocomplete="username" id="login__username" maxlength="10" type="text" name="username" class="form__input" placeholder="Phone" required onkeyup="checkUser('login__username')">
			</div>
			<div class="form__field">
				<label for="login__username">
					<svg class="icon"><use xlink:href="#icon-user"></use></svg>
					<span class="hidden">First name</span>
				</label>
				<input autocomplete="firstName" id="first__name" type="text" name="firstName" class="form__input" placeholder="First name" required>
			</div>
			<div class="form__field">
				<label for="login__username">
					<svg class="icon"><use xlink:href="#icon-user"></use></svg>
					<span class="hidden">Second name</span>
				</label>
				<input autocomplete="secondName" id="second__name" type="text" name="secondName" class="form__input" placeholder="Second name" required>
			</div>
			<div class="form__field">
				<label for="login__username">
					<svg class="icon indicatorRed"><use xlink:href="#icon-lock"></use></svg>
					<span class="hidden">Password</span>
				</label>
				<input autocomplete="password" id="password" type="text" name="password" class="form__input" placeholder="Password" required>
			</div>
			<div class="form__field">
				<label for="login__username">
					<svg class="icon indicatorRed"><use xlink:href="#icon-lock"></use></svg>
					<span class="hidden">Confirm Password</span>
				</label>
				<input autocomplete="confirmPassword" id="confirm__password" type="text" name="confirmPassword" class="form__input" placeholder="Confirm password" required onkeyup="passwordChecker('password','confirm__password')">
			</div>
			
			<div class="form__field">
				<a href="#" class="submit">Create</a>
			</div>
			<p class="text--center"><a href="#" onclick = "backToLogin()"><svg class="icon"><use xlink:href="#icon-arrow-left"></use></svg>  Back to Login</a></p>
		</form>
		<h5 class="messagetext">1. Username must be above 4 character.<br>2. Only number not allowed. <br>3. Symbols are not allowed in username <br>4. If the username is taken, the icons will stay red.</h5>
	</div>

	<svg xmlns="http://www.w3.org/2000/svg" class="icons">
	    <symbol id="icon-lock" viewBox="0 0 1792 1792">
	      <path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z" />
	    </symbol>
	    <symbol id="icon-user" viewBox="0 0 1792 1792">
	      <path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z" />
	    </symbol>
	     <symbol id="icon-mail" viewBox="0 0 24 24">
      <path d="M12 12.713L0 4.5V18c0 1.1.9 2 2 2h20c1.1 0 2-.9 2-2V4.5l-12 8.213zm11.85-10.85H.15C0 1.863 0 2.925 0 3v.132l12 8.214 12-8.214V3c0-.075 0-1.137-.15-1.137z" />
    </symbol>
    <symbol id="icon-arrow-left" viewBox="0 0 1792 1792">
    <path d="M192 960q0 54 37 91l651 651q39 37 91 37 51 0 90-37l75-75q38-38 38-91t-38-91l-293-293h704q52 0 84.5-37.5t32.5-90.5v-128q0-53-32.5-90.5t-84.5-37.5h-704l293-293q38-38 38-91t-38-91l-75-75q-38-38-90-38-52 0-91 38l-651 651q-37 37-37 91z"/>
	</symbol>
	<symbol id="icon-phone" viewBox="0 0 24 24">
    <path d="M6.62 10.79a15.054 15.054 0 006.59 6.59l2.2-2.2a1.003 1.003 0 011.01-.24c1.12.37 2.33.57 3.58.57.55 0 1 .45 1 1v3.5c0 .55-.45 1-1 1C10.74 22 2 13.26 2 2c0-.55.45-1 1-1H6.5c.55 0 1 .45 1 1 0 1.25.2 2.46.57 3.58.14.35.05.75-.24 1.01l-2.2 2.2z"/>
  </symbol>
  </svg>
</body>
<c:if test="${clear eq true}">
	<script>
	function clearIds(){
		document.getElementById('password').value = '';
		document.getElementById('confirm__password').value = '';
		document.getElementById('login__username').value = '';
		document.getElementById('first__name').value = '';
		document.getElementById('second__name').value = '';
	}
	clearIds();
	</script>
</c:if>
</html>
