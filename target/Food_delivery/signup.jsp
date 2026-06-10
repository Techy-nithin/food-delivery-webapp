<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>NammAFoodS | Sign Up</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    height: 100vh;
    background: linear-gradient(135deg, #ff6a00, #ff2f00);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* ================= SIGNUP CARD ================= */
.signup-box {
    width: 420px;
    padding: 40px 35px;
    background: rgba(255, 255, 255, 0.96);
    border-radius: 22px;
    box-shadow: 0 30px 60px rgba(0,0,0,0.35);
    animation: slideUp 0.9s ease;
}

/* HEADING */
.signup-box h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #222;
    font-size: 26px;
}

/* FLOATING INPUT */
.input-group {
    position: relative;
    margin-bottom: 18px;
}

.input-group input,
.input-group textarea {
    width: 100%;
    padding: 14px 12px;
    border-radius: 10px;
    border: 1.5px solid #ddd;
    font-size: 14px;
    outline: none;
    background: transparent;
    resize: none;
}

.input-group textarea {
    height: 70px;
}

.input-group label {
    position: absolute;
    top: 50%;
    left: 12px;
    color: #888;
    font-size: 14px;
    transform: translateY(-50%);
    pointer-events: none;
    transition: 0.3s;
    background: white;
    padding: 0 6px;
}

.input-group input:focus,
.input-group textarea:focus {
    border-color: #ff4d2d;
}

.input-group input:focus + label,
.input-group input:not(:placeholder-shown) + label,
.input-group textarea:focus + label,
.input-group textarea:not(:placeholder-shown) + label {
    top: -6px;
    font-size: 12px;
    color: #ff4d2d;
}

/* BUTTON */
.signup-btn {
    width: 100%;
    padding: 14px;
    margin-top: 15px;
    border: none;
    border-radius: 30px;
    background: linear-gradient(135deg, #ff6a00, #ff2f00);
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: transform 0.3s, box-shadow 0.3s;
    box-shadow: 0 10px 25px rgba(255,47,0,0.5);
}

.signup-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 18px 40px rgba(255,47,0,0.7);
}

/* FOOTER */
.footer {
    margin-top: 20px;
    text-align: center;
    font-size: 14px;
}

.footer a {
    color: #ff4d2d;
    font-weight: bold;
    text-decoration: none;
}

.footer a:hover {
    text-decoration: underline;
}

/* ANIMATION */
@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(40px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>
</head>

<body>

<div class="signup-box">
    <h2>Create Account 🚀</h2>

    <form action="Signup" method="post">

        <div class="input-group">
            <input type="text" name="name" required placeholder=" ">
            <label>Full Name</label>
        </div>

        <div class="input-group">
            <input type="email" name="email" required placeholder=" ">
            <label>Email</label>
        </div>

        <div class="input-group">
            <input type="password" name="password" required placeholder=" ">
            <label>Password</label>
        </div>

        <div class="input-group">
            <input type="text" name="phone" placeholder=" ">
            <label>Phone</label>
        </div>

        <div class="input-group">
            <textarea name="address" placeholder=" "></textarea>
            <label>Address</label>
        </div>

        <button type="submit" class="signup-btn">
            Create Account
        </button>

    </form>

    <div class="footer">
        Already have an account?
        <a href="login.jsp">Login</a>
    </div>
</div>

</body>
</html>
