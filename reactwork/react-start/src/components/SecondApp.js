import React from 'react';
import img1 from '../image/4.jpeg';

function SecondApp(props) {

    const imgstyle={
        border:'5px solid cadetblue',
        borderRadius:'100px',
        width:'130px'
    }

    // 문자도 변수로 줄 수 있음
    let helloEle=<h2 className='alert alert-info'>Hello~~~</h2>

    return (
        <div>
            <h2 className='alert alert-danger'>SecondApp입니다</h2>
            <img src={img1} style={imgstyle}/>
            {/* 문자열 변수로 준 것 호출 */}
            {helloEle}
            {helloEle}
            {helloEle}
        </div>
    );
}

export default SecondApp;