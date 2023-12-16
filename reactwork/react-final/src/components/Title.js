import React from 'react';
import titleimg from '../image/12.jpeg';

function Title(props) {
    return (
        <div>
            <img src={titleimg} style={{height:'150px'}}/>
            <b style={{fontSize:'20px',color:'green'}}>
                React_Springboot Project
            </b>
        </div>
    );
}

export default Title;