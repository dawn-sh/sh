import React from 'react';
import LoginForm from './LoginForm';
import Logout from './Logout';

function Login(props) {

    //localStorage 방법
    let loginok=localStorage.loginok;

    return (
        <div style={{marginLeft:'300px'}}>
            {
                loginok==null?<LoginForm/>:<Logout/>
            }
        </div>
    );
}

export default Login;