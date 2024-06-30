<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Your Ticket Login</title>
<script src="JavaScript/LoginValidation.js"></script>
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

a:focus, a:hover {
	text-decoration: underline;
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

.form input[type="password"], .form input[type="text"], .form input[type="submit"]
	{
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

.login label, .login input[type="text"], .login input[type="password"],
	.login input[type="submit"] {
	border-radius: var(--loginBorderRadus);
	padding: 1rem;
}

.login label {
	background-color: var(--loginLabelBackgroundColor);
	border-bottom-right-radius: 0;
	border-top-right-radius: 0;
	padding-inline: 1.25rem;
}

.login input[type="password"], .login input[type="text"] {
	background-color: var(--loginInputBackgroundColor);
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
}

.login input[type="password"]:focus, .login input[type="password"]:hover,
	.login input[type="text"]:focus, .login input[type="text"]:hover {
	background-color: var(--loginInputHoverBackgroundColor);
}

.login input[type="submit"] {
	background-color: var(--loginSubmitBackgroundColor);
	color: var(--loginSubmitColor);
	font-weight: 700;
	text-transform: uppercase;
}

.login input[type="submit"]:focus, .login input[type="submit"]:hover {
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
}

.form__submit {
    display: inline-block;
    padding: 1rem 1rem; /* Adjust padding as needed */
    background-color: var(--loginSubmitBackgroundColor);
    color: var(--loginSubmitColor);
    font-weight: 700;
    text-transform: uppercase;
    border-radius: var(--loginBorderRadus);
    text-align: center;
    transition: background-color 0.3s;
    cursor: pointer;
    text-decoration: none;
}

.form__submit:hover {
    background-color: var(--loginSubmitHoverBackgroundColor);
}

</style>
</head>
<body>
<body class="align">
	<div class="grid">
	<h1 class="holder">Book Your Show</h1>
	<span id="warning"></span>
		<form method="POST" class="form login" name="form">
			<div class="form__field">
				<label for="login__username">
					<svg class="icon"><use xlink:href="#icon-phone"></use></svg>
					<span class="hidden">Phone</span>
				</label>
				<input autocomplete="username" id="login__phone" type="text" name="phone" class="form__input" placeholder="Phone" required>
			</div>
			<div class="form__field">
				<label for="login__username">
					<svg class="icon"><use xlink:href="#icon-lock"></use></svg>
					<span class="hidden">Phone</span>
				</label>
				<input autocomplete="username" id="login__password" type="password" name="password" class="form__input" placeholder="Password" required>
			</div>
			<div class="form__submit">
				<a href="#" onclick="login()">Login</a>
			</div>
			<p class="text--center"><a href="#" onclick = "signUp()">Create account </a><svg class="icon"><use xlink:href="#icon-arrow-right"></use></svg></p>
		</form>
	</div>

	<svg xmlns="http://www.w3.org/2000/svg" class="icons">
	    <symbol id="icon-arrow-right" viewBox="0 0 1792 1792">
	      <path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z" />
	    </symbol>
	    <symbol id="icon-lock" viewBox="0 0 1792 1792">
	      <path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z" />
	    </symbol>
	    <symbol id="icon-phone" viewBox="0 0 24 24">
    		<path d="M6.62 10.79a15.054 15.054 0 006.59 6.59l2.2-2.2a1.003 1.003 0 011.01-.24c1.12.37 2.33.57 3.58.57.55 0 1 .45 1 1v3.5c0 .55-.45 1-1 1C10.74 22 2 13.26 2 2c0-.55.45-1 1-1H6.5c.55 0 1 .45 1 1 0 1.25.2 2.46.57 3.58.14.35.05.75-.24 1.01l-2.2 2.2z"/>
  		</symbol>
  </svg>
</body>
</body>
<c:if test="${warning eq true}">
<script>
	function userNotFoundValidate(){
		document.getElementById("warning").innerHTML = "Credential mismatch";
	}
	userNotFoundValidate();
</script>
</c:if>
</html>
